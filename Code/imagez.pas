unit imagez;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, PNGimage, StdCtrls, fileCtrl, math, Menus, head, inifiles, imzObject;

type

  TIMZEditMode = (zIMZmode, zPNGmode);

  TImzForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ScrollBar1: TScrollBar;
    Image1: TImage;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Button2: TButton;
    GroupBox2: TGroupBox;
    Edit2: TEdit;
    Label2: TLabel;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Timer1: TTimer;
    CheckBox1: TCheckBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Button6: TButton;
    RadioGroup1: TRadioGroup;
    Button7: TButton;
    N6: TMenuItem;
    N7: TMenuItem;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button9: TButton;
    Button8: TButton;
    Button10: TButton;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    ComboBox3: TComboBox;
    N8: TMenuItem;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CalImzLen(tempimz: Pimz);
    procedure SaveImzToFile(tempimz: Pimz; Fname: string);
    procedure ReadImzFromFile(tempimz: pimz; Fname: string);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure DrawImz;
    procedure CopyImzPNG(dest, ori: PimzPNG);
    procedure DrawimzPNGtoImage(imzPNG: PimzPNG; count, x, y: integer);
    procedure ScrollBar1Change(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Drawsquare(x, y: integer);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image1MouseLeave(Sender: TObject);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button4Click(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure N5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure InitialImzFromPath(tempimz: Pimz; Path: string);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Image1StartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure Button7Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
  public
    { Public declarations }
    imz: Timz;
    indexfile : string;
    IMZeditMode: TimzEditMode;
    IMZcanCopyPNG: Boolean;
    IMZCopyPNG: TIMZPNG;
    function GetEditMode: TimzEditMode;
    procedure SetEditMode(EMode: TimzEditMode);
  private
    { Private declarations }
    linepicnum: integer;   //每行图片数
    backcol: cardinal;     //背景颜色
    squarecol: cardinal;    //选框颜色
    squareW: integer;       //选框宽度
    squareH: integer;       //选框高度
    firstpicnum: integer;  //当前第一副图的序号
    nowpic: integer;       //现在鼠标指向的图片序号
    linenum: integer;      //窗体显示图片的行数
    titleh: integer;
    popmenupic: integer;
    Timercount: integer;
    imzBufbmp: Tbitmap;
    bufBmpInitial: boolean;
    timerdraw: boolean;
    PNGEditPath: string;
  end;

var
  imzDragInt: integer = -1;
  IMZDrag: boolean = false;


implementation

uses
  imzPNGedit, main;

{$R *.dfm}

function TImzForm.GetEditMode: TimzEditMode;
begin
  RadioGroup1.ItemIndex := integer(ImzEditMode);
  if RadioGroup1.ItemIndex = 1 then
    result := zPNGMode
  else
    result := zImzMode;
end;

procedure TImzForm.SetEditMode(EMode: TimzEditMode);
begin
  ImzEditMode := Emode;
  RadioGroup1.ItemIndex := Integer(ImzEditMode);
end;

procedure TImzForm.Button10Click(Sender: TObject);
var
  BeginGrpset, EndGrpset, I, offsetpos, temp, setint: integer;
begin
  try
    BeginGrpset := strtoint(edit4.Text);
    EndGrpset := strtoint(edit5.Text);
    setint := strtoint(edit7.Text);
  except
    exit;
  end;
  if BeginGrpset > EndGrpset then
  begin
    temp := BeginGrpset;
    BeginGrpset := EndGrpset;
    EndGrpset := temp;
  end;
  for I := BeginGrpset to EndGrpset do
  begin
    if (I < 0) then
      continue;
    if (I >= Imz.PNGnum) then
      break;
    case Combobox3.ItemIndex of
      0: Imz.imzPNG[I].y := setint;
      1: Imz.imzPNG[I].y := Imz.imzPNG[I].y + setint;
      2: Imz.imzPNG[I].y := Imz.imzPNG[I].y - setint;
      3: Imz.imzPNG[I].y := Imz.imzPNG[I].y * setint;
      4: Imz.imzPNG[I].y := Imz.imzPNG[I].y div setint;
    end;
  end;
end;

procedure TImzForm.Button1Click(Sender: TObject);
var
  path, dir: string;
begin
  path := edit1.Text;
  if path = '' then
    path := ExtractFilePath(paramstr(0));
  if path[length(path)] <> '\' then
    path := path + '\';
  if SelectDirectory('设置打包目录', dir, path) then
  begin
    if path[length(path)] <> '\' then
      path := path + '\';

    Edit1.Text := path;
  end;
end;

procedure TImzForm.Button2Click(Sender: TObject);
var
  Fname: string;
  path: string;
  I, I2, tempint, FH: integer;
  pakimz: Timz;
  ini: Tinifile;
begin
  indexfile := imzindexfilename;
  try
    ini := TiniFile.Create(ExtractFilePath(paramstr(0)) + iniFileName);
    indexfile := ini.ReadString('File', 'ImzIndexFileName', indexFile);
  finally
    ini.Free;
  end;
  path := Edit1.Text;
  if path = '' then
    path := ExtractFilePath(paramstr(0));
  if path[length(path)] <> '\' then
    path := path + '\';
  if not DirectoryExists(path) then
  begin
    //ForceDirectories(path);
    showmessage('目录不存在！');
    exit;
  end;
  SaveDialog1.Title := '保存imz文件名';
  SaveDialog1.Filter := '*.imz|*.imz';
  if Savedialog1.Execute then
  begin
    Fname := SaveDialog1.filename;
    if not SameText(ExtractFileExt(SaveDialog1.filename), '.imz') then
      fname := SaveDialog1.filename + '.imz';
    if not fileexists(path + indexfile) then
    begin
      showmessage('偏移文件不存在！');
      exit;
    end;

    FH := fileopen(path + indexfile, fmopenread);
    pakimz.PNGnum := fileseek(FH, 0, 2) shr 2;
    fileseek(FH, 0, 0);
    setlength(Pakimz.imzPNG, Pakimz.PNGnum);
    for I := 0 to pakimz.PNGnum - 1 do
    begin
      fileread(FH, pakimz.imzPNG[I].x, 2);
      fileread(FH, pakimz.imzPNG[I].y, 2);
    end;
    fileclose(Fh);

    for I := 0 to pakimz.PNGnum - 1 do
    begin
      if Fileexists(path + inttostr(I) + '.png') then
      begin
        pakimz.imzPNG[I].frame := 1;
        setlength(Pakimz.imzPNG[I].framelen, pakimz.imzPNG[I].frame);
        setlength(Pakimz.imzPNG[I].framedata, pakimz.imzPNG[I].frame);
        FH := fileopen(path + inttostr(I) + '.png', fmopenread);
        Pakimz.imzPNG[I].framelen[0] := fileseek(Fh, 0, 2);
        fileseek(Fh, 0, 0);
        setlength(Pakimz.imzPNG[I].framedata[0].data, Pakimz.imzPNG[I].framelen[0]);
        fileread(Fh, Pakimz.imzPNG[I].framedata[0].data[0], Pakimz.imzPNG[I].framelen[0]);
        fileclose(Fh);
      end
      else
      begin
        I2 := 0;
        while (fileexists(path + inttostr(I) + '_' + inttostr(I2) + '.png')) do
        begin
          inc(I2);
        end;
        pakimz.imzPNG[I].frame := I2;
        setlength(Pakimz.imzPNG[I].framelen, pakimz.imzPNG[I].frame);
        setlength(Pakimz.imzPNG[I].framedata, pakimz.imzPNG[I].frame);
        for I2 := 0 to pakimz.imzPNG[I].frame - 1 do
        begin
          Fh := fileopen(path + inttostr(I) + '_' + inttostr(I2) + '.png', fmopenread);
          Pakimz.imzPNG[I].framelen[I2] := fileseek(Fh, 0, 2);
          setlength(Pakimz.imzPNG[I].framedata[I2].data, Pakimz.imzPNG[I].framelen[I2]);
          fileseek(Fh, 0, 0);
          fileread(Fh, Pakimz.imzPNG[I].framedata[I2].data[0], Pakimz.imzPNG[I].framelen[I2]);
          fileclose(Fh);
        end;
      end;
    end;

    SaveImzToFile(@Pakimz, Fname);
    showmessage('IMZ文件打包成功！');
  end;

end;

procedure TImzForm.Button3Click(Sender: TObject);
begin
  opendialog1.FileName := edit2.Text;
  opendialog1.Filter := '*.imz|*.imz|All files (*.*)|*.*';
  if opendialog1.Execute then
  begin
    //ImzEditMode := ImzMode;
    SetEditMode(zImzMode);
    Edit2.Text := Opendialog1.FileName;
    Edit1.Text := ExtractFilePath(Opendialog1.FileName);
    Button5Click(Sender);
  end;
  SetCurrentDirectory(Pchar(ExtractFilePath(paramstr(0))));
end;

procedure TImzForm.Button4Click(Sender: TObject);
var
  path: string;
  I, FH: integer;
begin
  if ImzEditMode = zPNGMode then
  begin
    try
      FH := Filecreate(PNGEditPath + indexFile);
      for I := 0 to imz.PNGnum - 1 do
      begin  
        filewrite(FH, imz.imzPNG[I].x, 2);
        filewrite(FH, imz.imzPNG[I].y, 2);
      end;
    finally
      Fileclose(FH);
    end;
  end
  else
  begin
    if edit2.Text = '' then
    begin
      showmessage('保存的文件名无效！');
      exit;
    end;
    path := ExtractFilePath(edit2.Text);
    if path <> '' then
    begin
      if not DirectoryExists(path) then
      begin
        if ExtractFileDrive(Edit2.Text) = '' then
        begin
          edit2.Text := ExtractFilePath(paramstr(0)) + Edit2.Text;
        end
        else
          ForceDirectories(ExtractFilePath(edit2.Text));
      end;
    end
    else
    begin
      Edit2.Text := ExtractFilePath(paramstr(0)) + Edit2.Text;
    end;

    saveimztoFile(@imz, edit2.Text);
  end;
end;

procedure TImzForm.Button5Click(Sender: TObject);
begin
  //
  firstpicnum := 0;
  nowpic := -1;
  linenum := 0;
  if ImzEditMode = zImzMode then
    ReadImzFromFile(@imz, Edit2.Text)
  else
  begin
    InitialImzFromPath(@imz, Edit2.Text);
  end;
  if imz.PNGnum mod linepicnum = 0 then
    scrollbar1.Max := max(imz.PNGnum div linepicnum - 1, 0)
  else
    scrollbar1.Max := imz.PNGnum div linepicnum;
  scrollbar1.Position := 0;
  timercount := 0;
  DrawImz;
  Image1.Canvas.Lock;
  imzBufbmp.Canvas.Lock;
  image1.Canvas.CopyRect(image1.Canvas.ClipRect, imzBufbmp.Canvas, imzBufbmp.Canvas.ClipRect);
  Image1.Canvas.UnLock;
  imzBufbmp.Canvas.UnLock;
end;

procedure TImzForm.InitialImzFromPath(tempimz: Pimz; Path: string);
var
  ini: Tinifile;
  I, FH: integer;
  tpath: string;
begin
  indexfile := imzindexfilename;
  try
    ini := TiniFIle.Create(ExtractFilePath(paramstr(0)) + iniFileName);
    indexfile := ini.ReadString('File', 'ImzIndexFileName', indexFile);
  finally
    ini.Free;
  end;
  tpath := path;
  if tPath = '' then
    tpath := ExtractFilePath(paramstr(0));
  if tPath[length(tpath)] <> '\' then
    tpath := tpath + '\';
  try
    if not Fileexists(tpath + indexFile) then
    begin
      SetEditMode(zImzMode);
      //ImzEditMode := ImzMode;
      tempimz.PNGnum := 0;
      showmessage('索引文件:' + tpath + indexFile + '不存在！');
      exit;
    end;
    
    FH := Fileopen(tpath + indexFile, fmopenread);
    tempimz.PNGnum := Fileseek(FH, 0, 2) shr 2;

    Fileseek(FH, 0, 0);
    setlength(tempimz.imzPNG, tempimz.PNGnum);
    for I := 0 to tempimz.PNGnum - 1 do
    begin
      fileread(FH, tempimz.imzPNG[I].x, 2);
      fileread(FH, tempimz.imzPNG[I].y, 2);
    end;
  finally
    Fileclose(FH);
  end;

  PNGEditPath := Path;

end;

procedure TImzForm.Button6Click(Sender: TObject);
var
  path, dir: string;
begin
  path := ExtractFilePath(edit2.Text);
  if path = '' then
    path := ExtractFilePath(paramstr(0));
  if path[length(path)] <> '\' then
    path := path + '\';
  if SelectDirectory('读取PNG目录', dir, path) then
  begin
    //ImzEditMode := PNGMode;
    SetEditMode(zPNGMode);
    if path[length(path)] <> '\' then
      path := path + '\';
    Edit2.Text := path;
    Edit1.Text := path;
    Button5.Click;
  end;
end;

procedure TImzForm.Button7Click(Sender: TObject);
var
  dir: string;
  I1, I2: integer;
  FH: integer;
  ini: Tinifile;
begin

  if IMZEditMode = zPNGmode then
  begin
    showmessage('解包不支持文件夹编辑模式，只可以在IMZ文件编辑模式中使用！');
    exit;
  end;

  indexfile := imzindexfilename;
  try
    ini := TiniFile.Create(ExtractFilePath(paramstr(0)) + iniFileName);
    indexfile := ini.ReadString('File', 'ImzIndexFileName', indexFile);
  finally
    ini.Free;
  end;

  if imz.PNGnum <= 0 then
    exit;

  dir := edit1.Text;
  if dir = '' then
    dir := ExtractFilePath(paramstr(0));

  if dir[length(dir)] <> '\' then
    dir :=dir + '\';

  if not DirectoryExists(dir) then
      ForceDirectories(dir);

  try
    FH := Filecreate(dir + indexFile);
    for I1 := 0 to imz.PNGnum - 1 do
    begin
      filewrite(FH, imz.imzPNG[I1].x, 2);
      filewrite(FH, imz.imzPNG[I1].y, 2);
    end;
  finally
    Fileclose(FH);
  end;

  for I1 := 0 to imz.PNGnum - 1 do
  begin
    if imz.imzPNG[I1].frame = 1 then
    begin
      if imz.imzPNG[I1].framelen[0] > 0 then
      begin
        try
          FH := Filecreate(dir + inttostr(I1) + '.png');
          filewrite(FH, imz.imzPNG[I1].framedata[0].data[0], imz.imzPNG[I1].framelen[0]);
        finally
          Fileclose(FH);
        end;
      end;
    end
    else if imz.imzPNG[I1].frame > 1 then
    begin
      for I2 := 0 to imz.imzPNG[I1].frame - 1 do
        if imz.imzPNG[I1].framelen[I2] > 0 then
        begin
          try
            FH := Filecreate(dir + inttostr(I1) + '_' + inttostr(I2) + '.png');
            filewrite(FH, imz.imzPNG[I1].framedata[I2].data[0], imz.imzPNG[I1].framelen[I2]);
          finally
            Fileclose(FH);
          end;
        end;
    end;
  end;
  showmessage('解包成功！');
end;

procedure TImzForm.Button8Click(Sender: TObject);
var
  BeginGrpset, EndGrpset, I, offsetpos, temp, setint: integer;
begin
  try
    BeginGrpset := strtoint(edit4.Text);
    EndGrpset := strtoint(edit5.Text);
    setint := strtoint(edit6.Text);
  except
    exit;
  end;
  if BeginGrpset > EndGrpset then
  begin
    temp := BeginGrpset;
    BeginGrpset := EndGrpset;
    EndGrpset := temp;
  end;
  for I := BeginGrpset to EndGrpset do
  begin
    if (I < 0) then
      continue;
    if (I >= Imz.PNGnum) then
      break;
    case Combobox3.ItemIndex of
      0: Imz.imzPNG[I].x := setint;
      1: Imz.imzPNG[I].x := Imz.imzPNG[I].x + setint;
      2: Imz.imzPNG[I].x := Imz.imzPNG[I].x - setint;
      3: Imz.imzPNG[I].x := Imz.imzPNG[I].x * setint;
      4: Imz.imzPNG[I].x := Imz.imzPNG[I].x div setint;
    end;
  end;
end;

procedure TImzForm.Button9Click(Sender: TObject);
begin
  Button8Click(Sender);
  Button10Click(Sender);
end;

procedure TImzForm.DrawImz;
var
  ix, iy, I, I2, h, w, count, FH: integer;
begin
  //
  imzBufbmp.Canvas.Lock;
  imzBufbmp.Canvas.Brush.Color := BackCol;
  imzBufbmp.Canvas.Brush.Style := bssolid;
  imzBufbmp.Canvas.FillRect(image1.Canvas.ClipRect);
  imzBufbmp.Canvas.Font.Color := squarecol;
  imzBufbmp.Canvas.Brush.Style := bsclear;
  imzBufbmp.Canvas.Unlock;
  {image1.Canvas.Brush.Color := BackCol;
  image1.Canvas.Brush.Style := bssolid;
  image1.Canvas.FillRect(image1.Canvas.ClipRect);
  image1.Canvas.Font.Color := squarecol;
  image1.Canvas.Brush.Style := bsclear;}
  linenum := 0;
  ix := 0;
  iy := 0;
  h := 0;
  for I := firstpicnum to imz.PNGnum - 1 do
  begin
    if ix = linepicnum then
    begin
      ix := 0;
      inc(iy);
      h := h + squareH;
    end;
    linenum := iy;
    if h >= imzBufbmp.Height then
    //if h >= image1.Height then
      break;

    if ImzEditMode = zPNGMode then
    begin
      imz.imzPNG[I].frame := 0;
      if Fileexists(PNGEditPath + inttostr(I) + '.png') then
      begin
        imz.imzPNG[I].frame := 1;
        setlength(Imz.imzPNG[I].framelen, imz.imzPNG[I].frame);
        setlength(Imz.imzPNG[I].framedata, imz.imzPNG[I].frame);
        try
          FH := Fileopen(PNGEditPath + inttostr(I) + '.png', fmopenread);
          Imz.imzPNG[I].framelen[0] := fileseek(FH, 0, 2);
          fileseek(FH, 0, 0);
          setlength(Imz.imzPNG[I].framedata[0].data, Imz.imzPNG[I].framelen[0]);
          fileread(FH, Imz.imzPNG[I].framedata[0].data[0], Imz.imzPNG[I].framelen[0]);
        finally
          Fileclose(FH);
        end;
      end
      else
      begin
        i2 := 0;
        while (Fileexists(PNGEditPath + inttostr(I) + '_' + inttostr(i2) + '.png')) do
          inc(i2);
        imz.imzPNG[I].frame := i2;
        setlength(Imz.imzPNG[I].framelen, imz.imzPNG[I].frame);
        setlength(Imz.imzPNG[I].framedata, imz.imzPNG[I].frame);
        for I2 := 0 to imz.imzPNG[I].frame - 1 do
        begin
          try
            FH := Fileopen(PNGEditPath + inttostr(I) + '_' + inttostr(i2) + '.png', fmopenread);
            Imz.imzPNG[I].framelen[I2] := fileseek(FH, 0, 2);
            fileseek(FH, 0, 0);
            setlength(Imz.imzPNG[I].framedata[I2].data, Imz.imzPNG[I].framelen[I2]);
            fileread(FH, Imz.imzPNG[I].framedata[I2].data[0], Imz.imzPNG[I].framelen[I2]);
          finally
            Fileclose(FH);
          end;
        end;
      end;

      {try
        FH := Fileopen(PNGEditPath + indexFile, fmopenread);
        fileseek(FH, I shl 2, 0);
        fileread(FH, Imz.imzPNG[I].x, 2);
        fileread(FH, Imz.imzPNG[I].y, 2);
      finally
        Fileclose(FH);
      end; }

    end;

    if imz.imzPNG[I].frame > 1 then
      count := timercount mod imz.imzPNG[I].frame
    else
      count := 0;
    DrawimzPNGtoImage(@imz.imzPNG[I], count, ix * squareW, iy * squareH + titleh);

    imzBufbmp.Canvas.Lock;
    imzBufbmp.Canvas.TextOut(ix * squareW, iy * squareH, inttostr(I));
    imzBufbmp.Canvas.UnLock;
    //image1.Canvas.TextOut(ix * squareW, iy * squareH, inttostr(I));
    inc(ix);
  end;
  Scrollbar1.LargeChange := max(1, linenum - 1);
end;

procedure TImzForm.DrawimzPNGtoImage(imzPNG: PimzPNG; count, x, y: integer);
var
  PNG :TpngObject;
  temprs: Tmemorystream;
  rh, rw: integer;
  //sourcedata: pByteArray;
begin
  //
  if imzPNG.frame <= 0 then
    exit;
  try
  try
    PNG := TPNGObject.Create;
    temprs := Tmemorystream.Create;
    temprs.SetSize(imzPNG.framelen[count]);
    temprs.Position := 0;
    temprs.Write(imzPNG.framedata[Count].data[0], imzPNG.framelen[count]);
    temprs.Position := 0;


    PNG.LoadFromStream(temprs);
    if (PNG.Width > 0) and (PNG.Height > 0) then
    begin
      if (PNG.Height <= squareh - titleh) and (PNG.Width <= squarew) then
      begin
        rw := PNG.Width;
        rh := PNG.Height;
      end
      else
      begin
        if ((PNG.Width / squarew) > (PNG.Height / (squareh - titleh))) then
        begin
          rw := squarew;
          rh := max(Round(PNG.Height / (PNG.Width / squarew)), 1);
        end
        else
        begin
          rw := max(Round(PNG.Width / (PNG.Height / (squareh - titleh))), 1);
          rh := squareh - titleh;
        end;
      end;
      PNG.Draw(imzBufbmp.Canvas, Rect(x, y, x + rw, y + rh));
    end;
  except

  end;
    //imzBufbmp.Canvas.CopyRect(Rect(x, y, x + rw, y + rh), PNG.Canvas, PNG.Canvas.ClipRect);
  finally
    PNG.Destroy;
    //PNG.Free;
    temprs.Free;
  end;
end;

procedure TImzForm.CopyImzPNG(dest, ori: PimzPNG);
var
  I: integer;
begin
  //
  dest.len := ori.len;
  dest.x := ori.x;
  dest.y := ori.y;
  dest.frame := ori.frame;
  setlength(dest.framelen, dest.frame);
  setlength(dest.framedata, dest.frame);
  for I := 0 to dest.frame - 1 do
  begin
    dest.framelen[I] := ori.framelen[I];
    setlength(dest.framedata[I].data, dest.framelen[I]);
    copymemory(@dest.framedata[I].data[0], @ori.framedata[I].data[0], dest.framelen[I]);
  end;
end;

procedure TImzForm.CalImzLen(tempimz: Pimz);
var
  I, I2, tempint: integer;
begin
  //
  for I := 0 to tempimz.PNGnum - 1 do
  begin
    tempimz.imzPNG[I].len := 2 * 2 + 4 + tempimz.imzPNG[I].frame * 2 * 4;
    for I2 := 0 to tempimz.imzPNG[I].frame - 1 do
    begin
      tempimz.imzPNG[I].len := tempimz.imzPNG[I].len + tempimz.imzPNG[I].framelen[I2];
    end;
  end;
end;

procedure TImzForm.CheckBox1Click(Sender: TObject);
begin
  if checkbox1.Checked then
  begin
    timercount := 0;
    timer1.Enabled := true;
    timerdraw := false;
  end
  else
  begin
    timer1.Enabled := false;
    timercount := 0;
    DrawImz;
    Image1.Canvas.Lock;
    imzBufbmp.Canvas.Lock;
    image1.Canvas.CopyRect(image1.Canvas.ClipRect, imzBufbmp.Canvas, imzBufbmp.Canvas.ClipRect);
    imzBufbmp.Canvas.Unlock;
    Drawsquare(nowpic mod linepicnum * squarew, nowpic div linepicnum * squareh);
    Image1.Canvas.Unlock;
  end;
end;

procedure TImzForm.RadioGroup1Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex := integer(ImzEditMode);
end;

procedure TImzForm.ReadImzFromFile(tempimz: pimz; Fname: string);
var
  FH, I, I2, tempint: integer;
  offset, frameoffset: array of integer;
begin
  //
  try
    FH := Fileopen(Fname, fmopenread);
    fileread(FH, tempimz.PNGnum, 4);
    if tempimz.PNGnum < 0 then
      tempimz.PNGnum := 0;
    if tempimz.PNGnum > 0 then
    begin
      setlength(Offset, tempimz.PNGnum);
      fileread(FH, offset[0], tempimz.PNGnum * 4);
      setlength(tempimz.imzPNG, tempimz.PNGnum);
      for I := 0 to tempimz.PNGnum - 1 do
      begin
        fileseek(FH, offset[I], 0);
        fileread(FH, tempimz.imzPNG[I].x, 2);
        fileread(FH, tempimz.imzPNG[I].y, 2);
        fileread(FH, tempimz.imzPNG[I].frame, 4);
        if tempimz.imzPNG[I].frame > 0 then
        begin
          setlength(tempimz.imzPNG[I].framedata, tempimz.imzPNG[I].frame);
          setlength(tempimz.imzPNG[I].framelen, tempimz.imzPNG[I].frame);
          setlength(frameoffset, tempimz.imzPNG[I].frame);
        end;
        for I2 := 0 to tempimz.imzPNG[I].frame - 1 do
        begin
          fileread(FH, frameoffset[I2], 4);
          fileread(FH, tempimz.imzPNG[I].framelen[I2], 4);
        end;
        for I2 := 0 to tempimz.imzPNG[I].frame - 1 do
        begin
          setlength(tempimz.imzPNG[I].framedata[I2].data, tempimz.imzPNG[I].framelen[I2]);
          fileseek(FH, frameoffset[I2], 0);
          fileread(FH, tempimz.imzPNG[I].framedata[I2].data[0], tempimz.imzPNG[I].framelen[I2]);
        end;
      end;
    end;
    fileclose(FH);
    CalImzLen(tempimz);
  except
    fileclose(FH);
    tempimz.PNGnum := 0;
    setlength(tempimz.imzPNG, tempimz.PNGnum);
    showmessage('读取失败！');
  end;

end;

procedure TImzForm.SaveImzToFile(tempimz: Pimz; Fname: string);
var
  FH, I, I2, tempint, pos: integer;
  offset: array of integer;
  frameoffset: array of integer;
begin
  //
  CalImzLen(tempimz);
  FH := Filecreate(Fname, fmopenreadwrite);
  filewrite(FH, tempimz.PNGnum, 4);
  setlength(offset, tempimz.PNGnum);
  if tempimz.PNGnum > 0 then
  begin
    offset[0] := 4 + tempimz.PNGnum * 4;
    for I := 1 to tempimz.PNGnum - 1 do
    begin
      offset[I] := Offset[I - 1] + tempimz.imzPNG[I - 1].len;
    end;
    filewrite(FH, offset[0], tempimz.PNGnum * 4);
    pos := 4 + tempimz.PNGnum * 4;
    for I := 0 to tempimz.PNGnum - 1 do
    begin
      filewrite(FH, tempimz.imzPNG[I].x, 2);
      filewrite(FH, tempimz.imzPNG[I].y, 2);
      filewrite(FH, tempimz.imzPNG[I].frame, 4);
      inc(pos, 8);
      setlength(frameoffset, tempimz.imzPNG[I].frame);
      if tempimz.imzPNG[I].frame > 0 then
      begin
        pos := pos + tempimz.imzPNG[I].frame * 2 * 4;
        frameoffset[0] := pos;
        for I2 := 1 to tempimz.imzPNG[I].frame - 1 do
        begin
          frameoffset[I2] := frameoffset[I2 - 1] + tempimz.imzPNG[I].framelen[I2 - 1];
        end;
        for I2 := 0 to tempimz.imzPNG[I].frame - 1 do
        begin
          filewrite(FH, frameoffset[I2], 4);
          filewrite(FH, tempimz.imzPNG[I].framelen[I2], 4);
        end;
        for I2 := 0 to tempimz.imzPNG[I].frame - 1 do
        begin
          filewrite(FH, tempimz.imzPNG[I].framedata[I2].data[0], tempimz.imzPNG[I].framelen[I2]);
          inc(pos, tempimz.imzPNG[I].framelen[I2]);
        end;
      end;
    end;
    fileclose(FH);
  end
  else
    fileclose(FH);
end;

procedure TImzForm.ScrollBar1Change(Sender: TObject);
var
  tempbool: boolean;
begin
  tempbool := timer1.Enabled;
  timer1.Enabled := false;
  firstpicnum := scrollbar1.Position * linepicnum;
  drawImz;
  Image1.Canvas.Lock;
  imzBufbmp.Canvas.Lock;
  image1.Canvas.CopyRect(image1.Canvas.ClipRect, imzBufbmp.Canvas, imzBufbmp.Canvas.ClipRect);
  Image1.Canvas.UnLock;
  imzBufbmp.Canvas.UnLock;
  timer1.Enabled := tempbool;
end;

procedure TImzForm.Timer1Timer(Sender: TObject);
var
  ix, iy, h, I, count: integer;
begin
  if timerdraw then
    exit;
  timerdraw := true;
  inc(Timercount);
  ix := 0;
  iy := 0;
  h := 0;
  for I := firstpicnum to imz.PNGnum - 1 do
  begin
    if ix = linepicnum then
    begin
      ix := 0;
      inc(iy);
      h := h + squareH;
    end;
    linenum := iy;
    if h >= imzBufbmp.Height then
    //if h >= image1.Height then
      break;
    imzbufbmp.Canvas.Lock;
    if imz.imzPNG[I].frame > 1 then
    begin
      imzBufbmp.Canvas.Brush.Color := BackCol;
      imzBufbmp.Canvas.Brush.Style := bssolid;
      imzBufbmp.Canvas.FillRect(Rect(ix * squareW, iy * squareH, (ix + 1) * squareW, (iy + 1) * squareH));

      imzBufbmp.Canvas.Font.Color := squarecol;
      imzBufbmp.Canvas.Brush.Style := bsclear;


      count := timercount mod imz.imzPNG[I].frame;
      DrawimzPNGtoImage(@imz.imzPNG[I], count, ix * squareW, iy * squareH + titleh);
      imzBufbmp.Canvas.TextOut(ix * squareW, iy * squareH, inttostr(I));
    end;

    //image1.Canvas.TextOut(ix * squareW, iy * squareH, inttostr(I));
    inc(ix);
  end;

  image1.Canvas.Lock;
  image1.Canvas.CopyRect(image1.Canvas.ClipRect, imzBufbmp.Canvas, imzBufbmp.Canvas.ClipRect);
  imzbufbmp.Canvas.Unlock;
  if nowpic >= 0 then
    Drawsquare(nowpic mod linepicnum * squarew, nowpic div linepicnum * squareh);
  image1.Canvas.Unlock;
  timerdraw := false;
end;

procedure TImzForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
  IMZcopypng.frame := 0;
  setlength(IMZcopypng.framelen, 0);
  setlength(IMZcopypng.framedata, 0);

  CFormIMZ := true;

  bufBmpInitial := false;
  imzBufbmp.Free;

end;

procedure TImzForm.FormCreate(Sender: TObject);
begin
  IMZcanCopyPNG := false;
  timerdraw := false;
  imzBufbmp := Tbitmap.Create;
  IMZEditMode := zImzMode;
  PNGEditPath := '';
  bufBmpInitial := true;
  Timercount := 0;

  linepicnum := 10;
  backcol := clwhite;
  squarecol := clred;
  squareW := image1.Width div linepicnum;
  squareH := 100;
  titleh := 10;
  firstpicnum := 0;
  nowpic := -1;
  linenum := 0;
  imz.PNGnum := 0;
  imzBufbmp.Width := image1.Width;
  imzBufbmp.Height := image1.Height;

  timercount := 0;
  timer1.Enabled := true;
  timerdraw := false;

  Checkbox1.Checked := timer1.Enabled;

  //self.Width := self.Constraints.MinWidth;
  //self.Height := self.Constraints.MinHeight;
end;

procedure TImzForm.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  scrollbar1.Position := scrollbar1.Position + 1;
end;

procedure TImzForm.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  scrollbar1.Position := scrollbar1.Position - 1;
end;

procedure TImzForm.FormResize(Sender: TObject);
begin
  try
  image1.Picture.Bitmap.Width := image1.Width;
  image1.Picture.Bitmap.Height := image1.Height;
  imzBufbmp.Width := image1.Width;
  imzBufbmp.Height := image1.Height;
  squareW := image1.Width div linepicnum;
  DrawImz;
  Image1.Canvas.Lock;
  imzBufbmp.Canvas.Lock;
  image1.Canvas.CopyRect(image1.Canvas.ClipRect, imzBufbmp.Canvas, imzBufbmp.Canvas.ClipRect);
  Image1.Canvas.UnLock;
  imzBufbmp.Canvas.UnLock;
  except

  end;
end;

procedure TImzForm.Image1EndDrag(Sender, Target: TObject; X, Y: Integer);
begin
  IMZDrag := false;
end;

procedure TImzForm.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (button = mbLeft) and (nowpic + firstpicnum < imz.pngnum{filenum}) and (nowpic >= 0) then
  begin
    image1.BeginDrag(true);
  end;
end;

procedure TImzForm.Image1MouseLeave(Sender: TObject);
begin
  nowpic := -1;
  Image1.Canvas.Lock;
  imzBufbmp.Canvas.Lock;
  image1.Canvas.CopyRect(image1.Canvas.ClipRect, imzBufbmp.Canvas, imzBufbmp.Canvas.ClipRect);
  Image1.Canvas.UnLock;
  imzBufbmp.Canvas.UnLock;
end;

procedure TImzForm.Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  tempint: integer;
begin
  if ((x div squarew) >= linepicnum) then
    tempint := -1
  else
    tempint := x div squarew + y div squareh * linepicnum;
  if tempint <> nowpic then
  begin
    nowpic := tempint;
    //DrawImz;
    imzBufbmp.Canvas.Lock;
    image1.Canvas.Lock;
    image1.Canvas.CopyRect(image1.Canvas.ClipRect, imzBufbmp.Canvas, imzBufbmp.Canvas.ClipRect);
    imzBufbmp.Canvas.Unlock;
    Drawsquare(nowpic mod linepicnum * squarew, nowpic div linepicnum * squareh);
    image1.Canvas.Unlock;
  end;
end;

procedure TImzForm.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  mpos: TPoint;
begin
  if (Button = mbRight) then
  begin
    if ImzEditMode = zImzMode then
    begin
      if (nowpic >= 0) and (nowpic + firstpicnum < imz.PNGnum) then
      begin
        N1.Enabled := true;
        N2.Enabled := true;
        N3.Enabled := true;
      end
      else
      begin
        N1.Enabled := false;
        N2.Enabled := false;
        N3.Enabled := false;
      end;

      N4.Enabled := true;
      if imz.PNGnum <= 0 then
      begin
        N5.Enabled := false;
      end
      else
      begin
        N5.Enabled := true;
      end;

      N6.Enabled := N1.Enabled;
      N7.Enabled := N1.Enabled and IMZcanCopyPNG;

    end
    else
    begin
      if (nowpic >= 0) and (nowpic + firstpicnum < imz.PNGnum) then
        N1.Enabled := true
      else
        N1.Enabled := false;
      N2.Enabled := false;
      N3.Enabled := false;

      N4.Enabled := true;
      if imz.PNGnum <= 0 then
      begin
        N5.Enabled := false;
      end
      else
      begin
        N5.Enabled := true;
      end;

      N6.Enabled := false;
      N7.Enabled := false;
    end;
    popmenupic := nowpic + firstpicnum;
    getcursorpos(mpos);
    popupmenu1.Popup(mpos.X, mpos.Y);
  end;
end;

procedure TImzForm.Image1StartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  if nowpic >= 0 then
    imzdragint := nowpic + firstpicnum
  else
    imzDragint := -1;
  imzDrag := true;
end;

procedure TImzForm.N1Click(Sender: TObject);
var
  ImzPNGeditForm: TImzPNGeditForm;
begin
  //
  ImzPNGeditForm := TImzPNGeditForm.Create(Application);
  ImzPNGeditForm.imzPNG := @imz.imzPNG[popmenupic];
  ImzPNGeditForm.Initial(ImzEditMode);
  ImzPNGeditForm.ShowModal;
  ImzPNGeditForm.Free;
  DrawImz;
  Image1.Canvas.Lock;
  imzBufbmp.Canvas.Lock;
  image1.Canvas.CopyRect(image1.Canvas.ClipRect, imzBufbmp.Canvas, imzBufbmp.Canvas.ClipRect);
  Image1.Canvas.UnLock;
  imzBufbmp.Canvas.UnLock;
end;

procedure TImzForm.N2Click(Sender: TObject);
var
  I, Fh: integer;
begin
  opendialog1.FileName := '';
  opendialog1.Filter := '*.png|*.png|All files (*.*)|*.*';
  if opendialog1.Execute then
  begin
    if fileexists(opendialog1.FileName) then
    begin
      if imz.PNGnum < 0 then
        imz.PNGnum := 0;
      inc(imz.PNGnum);
      setlength(imz.imzPNG, imz.PNGnum);
      for I := imz.PNGnum - 2 downto popmenupic do
      begin
        copyimzPNG(@imz.imzPNG[I + 1], @imz.imzPNG[I]);
      end;

      imz.imzPNG[popmenupic].len := 0;
      imz.imzPNG[popmenupic].x := 0;
      imz.imzPNG[popmenupic].y := 0;
      imz.imzPNG[popmenupic].frame := 1;
      setlength(imz.imzPNG[popmenupic].framelen, imz.imzPNG[popmenupic].frame);
      setlength(imz.imzPNG[popmenupic].framedata, imz.imzPNG[popmenupic].frame);
      FH := fileopen(opendialog1.FileName, fmopenread);
      imz.imzPNG[popmenupic].framelen[0] := fileseek(FH, 0, 2);
      fileseek(FH, 0, 0);
      setlength(imz.imzPNG[popmenupic].framedata[0].data, imz.imzPNG[popmenupic].framelen[0]);
      fileread(FH, imz.imzPNG[popmenupic].framedata[0].data[0], imz.imzPNG[popmenupic].framelen[0]);
      Fileclose(FH);

      imz.imzPNG[popmenupic].len := 2 * 2 + 4 + imz.imzPNG[popmenupic].frame * 2 * 4 + imz.imzPNG[popmenupic].framelen[0];
      if imz.PNGnum mod linepicnum = 0 then
        scrollbar1.Max := imz.PNGnum div linepicnum - 1
      else
        scrollbar1.Max := imz.PNGnum div linepicnum;
      Drawimz;
      Image1.Canvas.Lock;
      imzBufbmp.Canvas.Lock;
      image1.Canvas.CopyRect(image1.Canvas.ClipRect, imzBufbmp.Canvas, imzBufbmp.Canvas.ClipRect);
      Image1.Canvas.UnLock;
      imzBufbmp.Canvas.UnLock;
      nowpic := -1;
    end;
  end;
end;

procedure TImzForm.N3Click(Sender: TObject);
var
  I: integer;
begin
  for I := popmenupic to imz.PNGnum - 2 do
  begin
    copyImzPNG(@imz.imzPNG[I], @Imz.imzPNG[I + 1]);
  end;
  dec(imz.PNGnum);
  if imz.PNGnum mod linepicnum = 0 then
    scrollbar1.Max := max(imz.PNGnum div linepicnum - 1, 0)
  else
    scrollbar1.Max := max(imz.PNGnum div linepicnum, 0);
  Drawimz;
  Image1.Canvas.Lock;
  imzBufbmp.Canvas.Lock;
  image1.Canvas.CopyRect(image1.Canvas.ClipRect, imzBufbmp.Canvas, imzBufbmp.Canvas.ClipRect);
  Image1.Canvas.UnLock;
  imzBufbmp.Canvas.UnLock;
  nowpic := -1;
end;

procedure TImzForm.N4Click(Sender: TObject);
var
  I, Fh: integer;
begin
  if ImzEditMode = zPNGMode then
  begin
    inc(imz.PNGnum);
    setlength(imz.imzPNG, imz.PNGnum);
    imz.imzPNG[imz.PNGnum - 1].len := 0;
    imz.imzPNG[imz.PNGnum - 1].x := 0;
    imz.imzPNG[imz.PNGnum - 1].y := 0;
    if imz.PNGnum mod linepicnum = 0 then
      scrollbar1.Max := imz.PNGnum div linepicnum - 1
    else
      scrollbar1.Max := imz.PNGnum div linepicnum;
    Drawimz;
    Image1.Canvas.Lock;
    imzBufbmp.Canvas.Lock;
    image1.Canvas.CopyRect(image1.Canvas.ClipRect, imzBufbmp.Canvas, imzBufbmp.Canvas.ClipRect);
    Image1.Canvas.UnLock;
    imzBufbmp.Canvas.UnLock;
    nowpic := -1;
  end;
  opendialog1.FileName := '';
  opendialog1.Filter := '*.png|*.png|All files (*.*)|*.*';
  if opendialog1.Execute then
  begin
    if fileexists(opendialog1.FileName) then
    begin
      if imz.PNGnum < 0 then
        imz.PNGnum := 0;
      inc(imz.PNGnum);
      setlength(imz.imzPNG, imz.PNGnum);
      imz.imzPNG[imz.PNGnum - 1].len := 0;
      imz.imzPNG[imz.PNGnum - 1].x := 0;
      imz.imzPNG[imz.PNGnum - 1].y := 0;
      imz.imzPNG[imz.PNGnum - 1].frame := 1;
      setlength(imz.imzPNG[imz.PNGnum - 1].framelen, imz.imzPNG[imz.PNGnum - 1].frame);
      setlength(imz.imzPNG[imz.PNGnum - 1].framedata, imz.imzPNG[imz.PNGnum - 1].frame);
      FH := fileopen(opendialog1.FileName, fmopenread);
      imz.imzPNG[imz.PNGnum - 1].framelen[0] := fileseek(FH, 0, 2);
      fileseek(FH, 0, 0);
      setlength(imz.imzPNG[imz.PNGnum - 1].framedata[0].data, imz.imzPNG[imz.PNGnum - 1].framelen[0]);
      fileread(FH, imz.imzPNG[imz.PNGnum - 1].framedata[0].data[0], imz.imzPNG[imz.PNGnum - 1].framelen[0]);
      Fileclose(FH);

      imz.imzPNG[imz.PNGnum - 1].len := 2 * 2 + 4 + imz.imzPNG[imz.PNGnum - 1].frame * 2 * 4 + imz.imzPNG[imz.PNGnum - 1].framelen[0];
      if imz.PNGnum mod linepicnum = 0 then
        scrollbar1.Max := imz.PNGnum div linepicnum - 1
      else
        scrollbar1.Max := imz.PNGnum div linepicnum;
      Drawimz;
      Image1.Canvas.Lock;
      imzBufbmp.Canvas.Lock;
      image1.Canvas.CopyRect(image1.Canvas.ClipRect, imzBufbmp.Canvas, imzBufbmp.Canvas.ClipRect);
      Image1.Canvas.UnLock;
      imzBufbmp.Canvas.UnLock;
      nowpic := -1;
    end;
  end;

end;

procedure TImzForm.N5Click(Sender: TObject);
begin
  dec(imz.PNGnum);
  if imz.PNGnum < 0 then
    imz.PNGnum := 0;
  setlength(imz.imzPNG, imz.PNGnum);
  if imz.PNGnum mod linepicnum = 0 then
    scrollbar1.Max := max(imz.PNGnum div linepicnum - 1, 0)
  else
    scrollbar1.Max := max(imz.PNGnum div linepicnum, 0);
  Drawimz;
  Image1.Canvas.Lock;
  imzBufbmp.Canvas.Lock;
  image1.Canvas.CopyRect(image1.Canvas.ClipRect, imzBufbmp.Canvas, imzBufbmp.Canvas.ClipRect);
  Image1.Canvas.UnLock;
  imzBufbmp.Canvas.UnLock;
  nowpic := -1;

end;

procedure TImzForm.N6Click(Sender: TObject);
var
  FormH, temphandle: cardinal;
  tempdata: array of byte;
  tempquit: boolean;
  tempbuf: TCopyDataStruct;
  tempchar: PByte;
  tempsize, I, I2: integer;
begin
  if (popmenupic < 0) or (popmenupic >= imz.PNGnum) then
    exit;
  CopyImzPNG(@imzcopypng, @imz.imzPNG[popmenupic]);
  IMZcanCopyPNG := true;

  //复制到其他正在运行的UPedit
  temphandle := 0;
  tempquit := true;

  tempsize := 12;
  for I := 0 to imzcopypng.frame - 1 do
  begin
    if imzcopypng.framelen[I] > 0 then
      inc(tempsize, imzcopypng.framelen[I]);
    inc(tempsize, 4);
  end;

  setlength(tempdata, tempsize + 4);

  PAnsiChar(@tempdata[0])^ := 'I';
  PAnsiChar(@tempdata[1])^ := 'M';
  PAnsiChar(@tempdata[2])^ := 'Z';
  tempdata[3] := 255;

  PInteger(@tempdata[4])^ := imzcopypng.len;
  PSmallint(@tempdata[8])^ := imzcopypng.x;
  PSmallint(@tempdata[10])^ := imzcopypng.y;
  PInteger(@tempdata[12])^ := imzcopypng.frame;

  I2 := 16;
  for I := 0 to imzcopypng.frame - 1 do
  begin
    Pinteger(@tempdata[I2])^ := max(0, imzcopypng.framelen[I]);
    inc(I2, 4);
    if imzcopypng.framelen[I] > 0 then
    begin
      copymemory(@tempdata[I2], @imzcopypng.framedata[I].data[0], imzcopypng.framelen[I]);
      inc(I2, imzcopypng.framelen[I]);
    end;
  end;

  getmem(tempchar, tempsize + 4);

  tempbuf.dwData := tempsize + 4;
  tempbuf.cbData := tempsize + 4;
  tempbuf.lpData := tempchar;
  copymemory(tempchar, @tempdata[0], tempsize + 4);

  while (tempquit) do
  begin
    FormH := 0;
    try
    FormH := FindWindowEx(0,temphandle, 'TUPeditMainForm', nil);
    if FormH = 0 then
    begin
      tempquit := false;
    end
    else
    begin
      temphandle := FormH;
      if FormH <> mainform.Handle then
      begin
        sendmessage(Formh, WM_COPYDATA, 0, integer(@tempbuf));
      end;
    end;
    except

    end;
  end;
  setlength(tempdata, 0);

end;

procedure TImzForm.N7Click(Sender: TObject);
begin
  copyImzPNG(@imz.imzPNG[popmenupic], @imzcopypng);
  drawIMZ;
  Image1.Canvas.Lock;
  imzBufbmp.Canvas.Lock;
  image1.Canvas.CopyRect(image1.Canvas.ClipRect, imzBufbmp.Canvas, imzBufbmp.Canvas.ClipRect);
  Image1.Canvas.UnLock;
  imzBufbmp.Canvas.UnLock;
  nowpic := -1;
end;

procedure TImzForm.N8Click(Sender: TObject);
var
  imzPNGnum, I: integer;
begin
  try
    imzPNGnum := Strtoint(inputbox('设置总贴图数', '设置总贴图数', inttostr(Imz.PNGnum)));
  except
    exit;
  end;
  if (imzPNGnum < 0) or (imzPNGnum = Imz.PNGnum) then
    exit;
  if imzPNGnum < imz.PNGnum then
  begin
    imz.PNGnum := imzPNGnum;
    setlength(imz.imzPNG, imz.PNGnum);
  end
  else
  begin
    setlength(imz.imzPNG, imzPNGnum);
    for I := imz.PNGnum to imzPNGnum - 1 do
    begin
      imz.imzPNG[I].len := 8;
      imz.imzPNG[I].x := 0;
      imz.imzPNG[I].y := 0;
      imz.imzPNG[I].frame := 0;
      setlength(imz.imzPNG[I].framelen, imz.imzPNG[I].frame);
      setlength(imz.imzPNG[I].framedata, imz.imzPNG[I].frame);
    end;
    imz.PNGnum := imzPNGnum;
  end;
  if imz.PNGnum mod linepicnum = 0 then
    scrollbar1.Max := max(imz.PNGnum div linepicnum - 1, 0)
  else
    scrollbar1.Max := max(imz.PNGnum div linepicnum, 0);
  Drawimz;
  Image1.Canvas.Lock;
  imzBufbmp.Canvas.Lock;
  image1.Canvas.CopyRect(image1.Canvas.ClipRect, imzBufbmp.Canvas, imzBufbmp.Canvas.ClipRect);
  Image1.Canvas.UnLock;
  imzBufbmp.Canvas.UnLock;
  nowpic := -1;
end;

procedure TImzForm.Drawsquare(x, y: integer);
var
  Ix, iy: integer;
begin
  //
  iy := y;
  for Ix := x to x + squarew - 1 do
  begin
    image1.Canvas.Pixels[ix, iy] := squarecol;
    image1.Canvas.Pixels[ix, iy + squareH] := squarecol;
  end;
  ix := x;
  for Iy := y to y + squareh - 1 do
  begin
    image1.Canvas.Pixels[ix, iy] := squarecol;
    image1.Canvas.Pixels[ix + squareW, iy] := squarecol;
  end;
end;

end.
