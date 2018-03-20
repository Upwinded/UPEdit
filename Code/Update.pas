unit Update;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, inifiles, head, ExtCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, filectrl, shellapi, ZLib,
  IdAntiFreezeBase, IdAntiFreeze;

type

  TZIPThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

  TEXEThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

  TAllFileThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

  TForm87 = class(TForm)
    ProgressBar1: TProgressBar;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    IdHTTP1: TIdHTTP;
    Label1: TLabel;
    Button4: TButton;
    Button5: TButton;
    Label2: TLabel;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure IdHTTP1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdHTTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdHTTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button6Click(Sender: TObject);

  private
    EXEThread: TexeThread;
    ZIPTHread: Tzipthread;
    AllFileThread: TAllFileThread;
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure DownLoadZip;
  procedure DownLoadExe;
  procedure restart;
  procedure resetprogressbar;
  procedure resetprogressbarexe;
  procedure showdownloaderror;
  procedure Handlezip;
  procedure resetprogressbarzip;
  procedure OnDeCompress;
  procedure Checkerror;
  procedure CheckStep;

var
  Form87: TForm87;
  updatefilename: string;
  updaters: TmemoryStream;
  Downloading: boolean = false;
  needrestart: boolean = false;
  maxsize: int64;
  updateerror: boolean;
  canexit: boolean;
  threadexit: boolean= false;
  updatefilenum: integer = 0;
  filenamearray: array of string;
  newVersion: String = '';

implementation

uses
  main;

{$R *.dfm}

procedure TForm87.Button1Click(Sender: TObject);
var
  dir: string;

begin
  if SelectDirectory('ѡ����±����ַ',dir, dir) then
  begin
    if dir[length(dir)] <> '\' then
      dir :=dir + '\';
    edit1.Text := dir;
    //filename := ExtractFilePath(Paramstr(0)) + 'UPedit.ini';
    // ini := TIniFile.Create(filename);
    updatepath := Edit1.Text;
  end;
end;

procedure TForm87.Button2Click(Sender: TObject);
begin
  if not downloading then
  begin
    idhttp1.ConnectTimeout :=  1000   *   10;//��ʱ
    idhttp1.ReadTimeout :=   1000   *   10;//��ʱ
    idhttp1.Request.Connection := 'close';
    updatepath := Edit1.Text;
    ZipThread := Tzipthread.Create(False);
  end
  else
    showmessage('�������������У������ĵȴ����Ժ��ٽ��в�����');
end;

procedure DownLoadZip;
var
  Dbat: TextFile;
  I, upfilenum: integer;
begin
  if (MessageBox(Form87.Handle, '�ļ�������ɣ��Ƿ�������ɸ���(�������ѡ��Ҫ�滻���ļ�֮���Զ�����)��',  '�������', MB_OKCancel) = 1) then
  begin
    //ShellExecute(Handle,'open',Pwidechar('Explorer.exe'),PWidechar( '/select,'  + updatepath + Updatefilename), nil,1);
    AssignFile(DBat, 'UpdateUPedit.bat');
    Rewrite(DBat);
    Writeln(DBat,'@echo off');
    Writeln(DBat,'TASKKILL /F /IM '+ParamStr(0));
    writeln(Dbat,'@ping 127.0.0.1 -n 3 >nul ');
    //Writeln(DBat,'del '+ParamStr(0)); //д��ɾ�������������
    for I := 0 to updatefilenum - 1 do
    begin
      if not(fileexists(filenamearray[I])) or (messagebox(Form87.Handle,Pwidechar('�ļ�"' + Filenamearray[I] + '"�Ѿ������Ƿ񸲸ǣ�'), '�ļ��Ѵ���', MB_OKCancel) = 1) then
      begin
        Writeln(DBat,'copy ' + ExtractFilePath(Paramstr(0))+ filenamearray[I] + '.tmp ' + ExtractFilePath(Paramstr(0)) + filenamearray[I]);
      end;
      Writeln(DBat,'del ' + ExtractFilePath(Paramstr(0)) + filenamearray[I] + '.tmp');
    end;
    writeln(Dbat,'@ping 127.0.0.1 -n 2 >nul ');
    Writeln(DBat,'start "" "' + ExtractFilePath(Paramstr(0)) + 'UPedit.exe'+'"');

    Writeln(DBat,'del %0'); //ɾ��BAT�ļ�����
    Writeln(DBat,'exit');
    CloseFile(DBat);
    needrestart := true;
  end
  else
  begin
    //Synchronize(resetprogressbarexe);
    needrestart := false;
    //showmessage('δ��ɸ��£����ֶ�����UPedit.exe.tmp��UPedit.exe��');
    //DownloadUpdate := true;

  end;

end;

procedure OnDeCompress;
begin
  Form87.Label2.Caption := '���ڽ�ѹ�������ļ�';
end;

procedure TAllFileThread.Execute;
var
  FName: string;
  offset: array of integer;
  I, Pdata, FH, I2: integer;
  DeComRs:TMemoryStream;
  DeCompressStream: TDeCompressionStream;
  data, filedata, tempdata: array of byte;
  Pnt: Pbyte;
begin
  //Synchronize(DownLoadZip);
  freeonterminate := true;
  updateerror := false;
  Downloading := true;
 // downloadEXE;
  threadexit := false;
  canexit := false;
  updateerror := false;
  FName := 'upedit_allfile.txt';
  updaters := TmemoryStream.Create;
  Updaters.Clear;
  updaters.Position := 0;
  try
    Form87.idhttp1.Get(Form87.IdHTTP1.URL.URLEncode('http://www.upwinded.com/upedit/' + FName), updaters);
  except
    if not threadexit then
      Synchronize(showdownloaderror);
    Form87.IdHTTP1.Disconnect;
    Downloading := false;
    updateerror := true;
    canexit := true;
  end;
  if not threadexit then
  begin
    if not canexit then
    begin
      Synchronize(OnDeCompress);
      try
      DeCompressStream := TDeCompressionStream.Create(updaters);
      DeComRs := TmemoryStream.Create;
      DeComRs.LoadFromStream(DeCompressStream);
      DeCompressStream.Free;
      updaters.Free;
      DeComRs.Position := 0;
      setlength(data,DeComRs.Size);
      DeComRs.Position := 0;
      DeComRs.ReadBuffer(data[0], DeComRs.Size);
      DeComRs.Free;
      Pdata := 0;
      updatefilenum := Pinteger(@data[Pdata])^;
      inc(Pdata,4);
      setlength(offset, updatefilenum);
      setlength(filenamearray, updatefilenum);
      for I := 0 to updatefilenum - 1 do
      begin
        offset[I] := Pinteger(@data[Pdata])^;
        inc(Pdata,4);
      end;
      for I := 0 to updatefilenum - 1 do
      begin
        setlength(filenamearray[I], offset[I] div 2);
        copymemory(Pwidechar(Filenamearray[I]), @data[Pdata],offset[I]);
        inc(Pdata, offset[I]);
      end;
      for I := 0 to updatefilenum - 1 do
      begin
        offset[I] := Pinteger(@data[Pdata])^;
        inc(Pdata,4);
      end;
      for I := 0 to updatefilenum - 1 do
      begin
        setlength(filedata, offset[I]);
        copymemory(@filedata[0],@data[Pdata],offset[I]);
        inc(Pdata,offset[I]);
        FH := filecreate(ExtractFilePath(Paramstr(0)) + filenamearray[I]+'.tmp');
        filewrite(FH, filedata[0], Offset[I]);
        fileclose(FH);
      end;

      finally

      end;
      Synchronize(DownloadZIP);
    end;

    if updateerror then
      Synchronize(resetprogressbar)
    else if needrestart then
      Synchronize(restart)
    else
      Synchronize(resetprogressbarzip);

  end
  else
    updaters.free;
  Downloading := false;
  Synchronize(resetprogressbar);
  //Synchronize(resetprogressbar);
end;

procedure Handlezip;
begin
  if (MessageBox(FOrm87.Handle, 'ѹ����������ɣ��Ƿ���ļ��洢��Ŀ¼��',  '���', MB_OKCancel) = 1) then
  begin
    ShellExecute(Application.Handle,'open',Pwidechar('Explorer.exe'),PWidechar( '/select,'  + updatepath + Updatefilename), nil,1);
  end;
end;

procedure TForm87.Button3Click(Sender: TObject);
begin
  self.Close;
end;

procedure TForm87.Button4Click(Sender: TObject);
begin
  if not Downloading then
  begin
    idhttp1.ConnectTimeout :=  1000   *   10;//��ʱ
    idhttp1.ReadTimeout :=   1000   *   10;//��ʱ
    idhttp1.Request.Connection := 'close';
    EXEThread := TexeThread.Create(false);
  end
  else
    showmessage('�������������У������ĵȴ����Ժ��ٽ��в�����');
end;



procedure TForm87.Button5Click(Sender: TObject);
var
  MYMD5,newVersionMD5: string;
  temprs: TStringStream;
  temprs2: Tfilestream;
  idhttp2: Tidhttp;
begin

  idhttp2 := Tidhttp.Create(nil);
  idhttp2.ConnectTimeout := 1000 * 5;
  idhttp2.ReadTimeout := 1000 * 5;
  //showmessage('http�����ɹ��ɹ�');


  temprs := TStringStream.Create;

  //showmessage('http�����ɹ��ɹ�');
  temprs.Clear;
  temprs.Position := 0;
  try
    idhttp2.Get('http://www.upwinded.com/upedit/upversion.txt', temprs);
  except
        showmessage('������ʧ�ܣ�');
        exit;
  end;
  //showmessage('�õ��汾�ųɹ�');
  temprs.Position := 0;
  MYMD5 := hashmyself;
  newVersionMD5 := temprs.readString(length(MYMD5));
  newVersion := newVersionMD5;
  temprs.Free;
  if CompareStr(MYMD5, NewVersionMD5) <> 0 then
  begin
    if (MessageBox(Application.Handle, '���������°汾������Ҫ���������������ѡ��"ȡ��"������ѡ����·�ʽ��',  '��⵽����', MB_OKCancel) = 1) then
    begin
      Button4Click(sender);
    end;
  end
  else
    showmessage('�Ѿ������°汾������Ҫ���£�');
  idhttp2.Free;
end;

procedure TForm87.Button6Click(Sender: TObject);
begin
  if not Downloading then
  begin
    if (MessageBox(Application.Handle, '��������ȫ���ļ�������ܻ�ʹ���ڵ������ļ�(UPedit.ini)�����weyl����ԭ�����׵������ļ�(�������Ҫ���������ļ���Ҳ����������ȫ�������ļ�֮��ѡ���滻�����ļ�)�������������Ҫ��ֻ�����������Ƿ��������ȫ���ļ���',  'UPedit��ʾ', MB_OKCancel) = 1)  then
    begin
      idhttp1.ConnectTimeout :=  1000   *   10;//��ʱ
      idhttp1.ReadTimeout :=   1000   *   10;//��ʱ
      idhttp1.Request.Connection := 'close';
      AllFileThread := TAllFileThread.Create(false);
    end;
  end
  else
    showmessage('�������������У������ĵȴ����Ժ��ٽ��в�����');
end;

procedure TForm87.FormClose(Sender: TObject; var Action: TCloseAction);
var
  discont: boolean;
begin
 { if not downloading then
  begin
    //self.Close
  end
  else }
  if downloading then  
  begin
    label2.Caption := '����ֹͣ...';
    canexit := true;
    threadexit := true;

    idhttp1.ConnectTimeout :=  50;//1��
    idhttp1.ReadTimeout :=   50;//1��
    idhttp1.Request.Connection := 'close';
   { discont := false;
    while discont do
    begin
      try
        
        idhttp1.Disconnect;
        discont := true;

      except

      end;
    end; }

    //if exethread.Terminated and zipthread.Terminated then
    //self.Close;
  end;
end;

procedure TForm87.FormCreate(Sender: TObject);
begin
  edit1.Text := updatepath;
end;

procedure TForm87.IdHTTP1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  ProgressBar1.Position:=AWorkCount;
  label2.Caption := floattostr(Round(AworkCount/1024)) + 'kB / '+ floattostr(maxsize) + 'kB';
  if threadexit then
    self.IdHTTP1.Disconnect;
end;

procedure TForm87.IdHTTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  ProgressBar1.Max:=AWorkCountMax;
  maxsize := Round(AworkCountMax/1024);
  ProgressBar1.Min:=0;
  ProgressBar1.Position:=0;
  label2.Visible := true;
end;

procedure TForm87.IdHTTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  ProgressBar1.Position:=ProgressBar1.Max;
  label2.Visible := false;
end;

procedure TZIPThread.Execute;
var
  ini: Tinifile;
  filename: string;

  newname: string;
begin
  //Synchronize(DownLoadZip);
  freeonterminate := true;
  Downloading := true;
  canexit := false;
  threadexit := false;

  if updatepath[length(updatepath)] <> '\' then
      updatepath := updatepath + '\';

  filename := ExtractFilePath(Paramstr(0)) + iniFilename;
  ini := TIniFile.Create(filename);
  ini.writestring('run', 'updatapath',updatepath);
  ini.Free;

  updaters := TmemoryStream.Create;

    updatefilename := 'upedit.zip';
    newname := 'upedit_zip.txt';

  Updaters.Clear;
  updaters.Position := 0;
  try
  FOrm87.idhttp1.Get(FOrm87.IdHTTP1.URL.URLEncode('http://www.upwinded.com/upedit/' + newname), updaters);
  //FOrm87.idhttp1.Get(FOrm87.IdHTTP1.URL.URLEncode('Http://Upwinded.ym6.cn/UPedit/' + Updatefilename), updaters);
  except
          if not threadexit then
            Synchronize(showdownloaderror);
          FOrm87.idhttp1.Disconnect;
          canexit := true;
  end;
  if not threadexit then
  begin
  if not canexit then
  begin
  updaters.SaveToFile(updatepath + Updatefilename);
  Synchronize(Handlezip);
 // Form87.progressbar1.Position := 0;

  updaters.free;
  end;

  end
  else
    updaters.free;
  Downloading := false;
  Synchronize(resetprogressbar);

end;

procedure TEXEThread.Execute;
var
  temprs: TStringStream;
  UpdateMD5: String;
  checkexeerror: Boolean;
begin
  //Synchronize(DownLoadZip);
  checkexeerror := false;
  freeonterminate := true;
  updateerror := false;
  Downloading := true;
 // downloadEXE;
  threadexit := false;
  canexit := false;
  updateerror := false;
  updaters := TmemoryStream.Create;
  Updaters.Clear;
  updaters.Position := 0;
  try
  Form87.idhttp1.Get(Form87.IdHTTP1.URL.URLEncode('http://www.upwinded.com/upedit/' + 'upedit.txt'), updaters);
  except
         if not threadexit then
           Synchronize(showdownloaderror);
         Downloading := false;
         updateerror := true;
         canexit := true;
  end;

  if not threadexit then
  begin
    if not canexit then
    begin
      updaters.SaveToFile(ExtractFilePath(Paramstr(0)) + 'upedit.exe.tmp');
      updaters.free;
      UpdateMD5 := hashFile(ExtractFilePath(Paramstr(0)) + 'upedit.exe.tmp');

      if newVersion = '' then
      begin
        temprs := TStringStream.Create;
        temprs.Clear;
        temprs.Position := 0;
        Form87.idhttp1.Get('http://www.upwinded.com/upedit/upversion.txt', temprs);
        temprs.Position := 0;
        newVersion := temprs.readString(Length(UpdateMD5));
        temprs.Free;
      end;

      if CompareStr(UpdateMD5, NewVersion) <> 0 then
      begin
        checkexeerror := true;
        Downloading := false;

      end
      else
        Synchronize(DownloadEXE);
    end;
     if updateerror then
       Synchronize(resetprogressbar)
     else if needrestart then
       Synchronize(restart)
     else if checkexeerror then
       Synchronize(Checkerror)
     else
       Synchronize(resetprogressbarexe);

  end
  else
    updaters.free;
  Downloading := false;
  Synchronize(resetprogressbar);
  //Synchronize(resetprogressbar);
end;

procedure restart;
begin
  application.Terminate;
  WinExec( Pansichar(Ansistring(ExtractFilePath(Paramstr(0)) + 'UpdateUPedit.bat')),SW_HIDE);
end;

procedure showdownloaderror;
begin
  showmessage('���ص�ַ��ʱʧЧ�����ֶ�����վ���ء�');
end;

procedure Checkerror;
begin
  showmessage('����У��ʧ�ܡ�');
end;

procedure CheckStep;
begin
  showmessage('000');
end;

procedure DownLoadExe;
var
  Dbat: TextFile;
begin
  if (MessageBox(Form87.Handle, '�ļ�������ɣ����ڳ�����Ҫ�Զ�����������ɸ��£��Ƿ�����������',  '�������', MB_OKCancel) = 1) then
  begin
    //ShellExecute(Handle,'open',Pwidechar('Explorer.exe'),PWidechar( '/select,'  + updatepath + Updatefilename), nil,1);
    AssignFile(DBat, ExtractFilePath(Paramstr(0)) + 'UpdateUPedit.bat');
    Rewrite(DBat);
    Writeln(DBat,'@echo off');
    Writeln(DBat,'TASKKILL /F /IM '+ParamStr(0));
    writeln(Dbat,'@ping 127.0.0.1 -n 3 >nul ');
    Writeln(DBat,'del '+ParamStr(0)); //д��ɾ�������������
    Writeln(DBat,'copy ' +ExtractFilePath(Paramstr(0))+'UPedit.exe.tmp ' + ParamStr(0));
    Writeln(DBat,'del '+ExtractFilePath(Paramstr(0))+'UPedit.exe.tmp');
    Writeln(DBat,'start "" "' + ParamStr(0)+'"');

    Writeln(DBat,'del %0'); //ɾ��BAT�ļ�����
    Writeln(DBat,'exit');
    CloseFile(DBat);
    needrestart := true;
  end
  else
  begin
    //Synchronize(resetprogressbarexe);
    needrestart := false;
    //showmessage('δ��ɸ��£����ֶ�����UPedit.exe.tmp��UPedit.exe��');
    //DownloadUpdate := true;

  end;

end;

procedure resetprogressbar;
begin
  Form87.progressbar1.Position := 0;
end;

procedure resetprogressbarexe;
begin
  showmessage('δ��ɸ��£����ֶ�����UPedit.exe.tmp��UPedit.exe��');
  Form87.progressbar1.Position := 0;
end;

procedure resetprogressbarzip;
begin
  showmessage('δ��ɸ��£����ֶ�ȥ�������ļ���.tmp��չ����');
  Form87.progressbar1.Position := 0;
end;

end.
