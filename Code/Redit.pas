unit Redit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, head, ExtCtrls, StdCtrls, inifiles, ComCtrls, comobj,
  {XLSFonts4, XLSReadWriteII4, SheetData4,} CheckLst, math,
  System.IOUtils,
  VCL.FlexCel.Core, FlexCel.XlsAdapter;

type

  TForm5 = class(TForm)
    Panel1: TPanel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Panel2: TPanel;
    ComboBox3: TComboBox;
    StatusBar1: TStatusBar;
    Button5: TButton;
    Button6: TButton;
    OpenDialog1: TOpenDialog;
    Panel3: TPanel;
    CheckListBox1: TCheckListBox;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox4: TComboBox;
    Edit3: TEdit;
    Button10: TButton;
    Label5: TLabel;
    Button11: TButton;
    SaveDialog1: TSaveDialog;
    Button12: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);

    procedure displayR;
    procedure arrange;

    procedure ComboBox1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure FormResize(Sender: TObject);
    procedure checklistbox1DblClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure checklistbox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure changeRitem(idxnum, pos1,pos2,pos3: integer);
    procedure ComboBox2Select(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RFile: TRFile;
  Rini: array of TRini;
  typenumber: integer;
  typename: array of string;
  typedataitem: array of integer;
  Rinitial: boolean = false;
  Rselect: array of Tselect;
  candisplayR : boolean = true;


procedure copyRdata(source, dest:PRdata);
function readR(idx,grp: string; PRF: PRfile): boolean;
procedure readini;
procedure calnamepos(PRF: PRFile);
procedure saveR(idx,grp:string; PRF:PRFile);
procedure addnewRdata(PRF: PRFile; CRType: integer; PRD: PRData);

implementation

{$R *.dfm}

uses
  main, ReditForm;

procedure TForm5.Button10Click(Sender: TObject);
var
  I, a,b, temp: integer;
begin
  if Radiobutton1.Checked then
  begin
    for I := 0 to length(Rselect) - 1 do
      if checklistbox1.Checked[I] then
      begin
        case combobox4.ItemIndex of
          0:
            begin
              WriteRDataStr(@Rfile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[I].pos1].Rarray[Rselect[I].pos2].dataarray[Rselect[I].pos3], edit3.Text);
            end;
          1:
            begin
              if Rfile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[I].pos1].Rarray[Rselect[I].pos2].dataarray[Rselect[I].pos3].datatype = 0 then
                WriteRDataInt(@Rfile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[I].pos1].Rarray[Rselect[I].pos2].dataarray[Rselect[I].pos3], strtoint64(edit3.Text) + ReadRDataInt(@Rfile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[I].pos1].Rarray[Rselect[I].pos2].dataarray[Rselect[I].pos3]));
            end;
          2:
            begin
              if Rfile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[I].pos1].Rarray[Rselect[I].pos2].dataarray[Rselect[I].pos3].datatype = 0 then
                WriteRDataInt(@Rfile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[I].pos1].Rarray[Rselect[I].pos2].dataarray[Rselect[I].pos3], ReadRDataInt(@Rfile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[I].pos1].Rarray[Rselect[I].pos2].dataarray[Rselect[I].pos3]) - strtoint64(edit3.Text));
            end;
          3:
            begin
              if Rfile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[I].pos1].Rarray[Rselect[I].pos2].dataarray[Rselect[I].pos3].datatype = 0 then
                WriteRDataInt(@Rfile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[I].pos1].Rarray[Rselect[I].pos2].dataarray[Rselect[I].pos3], ReadRDataInt(@Rfile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[I].pos1].Rarray[Rselect[I].pos2].dataarray[Rselect[I].pos3]) * strtoint64(edit3.Text));
            end;
          4:
            begin
              if Rfile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[I].pos1].Rarray[Rselect[I].pos2].dataarray[Rselect[I].pos3].datatype = 0 then
                WriteRDataInt(@Rfile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[I].pos1].Rarray[Rselect[I].pos2].dataarray[Rselect[I].pos3], ReadRDataInt(@Rfile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[I].pos1].Rarray[Rselect[I].pos2].dataarray[Rselect[I].pos3]) div strtoint64(edit3.Text));
            end;
        end;
      end;
  end
  else if Radiobutton2.Checked then
  begin
    a := strtoint64(edit1.Text);
    b := strtoint64(edit2.Text);
    if a > b then
    begin
      i := a;
      a := b;
      b := i;
    end;
    for I := a to b do
    begin
      case combobox4.ItemIndex of
        0:
          begin
            WriteRDataStr(@Rfile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[I].pos1].Rarray[Rselect[I].pos2].dataarray[Rselect[I].pos3], edit3.Text);
          end;
        1:
          begin
            if Rfile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[I].pos1].Rarray[Rselect[I].pos2].dataarray[Rselect[I].pos3].datatype = 0 then
              WriteRDataInt(@Rfile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[I].pos1].Rarray[Rselect[I].pos2].dataarray[Rselect[I].pos3], strtoint64(edit3.Text) + ReadRDataInt(@Rfile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[I].pos1].Rarray[Rselect[I].pos2].dataarray[Rselect[I].pos3]));
          end;
        2:
          begin
            if Rfile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[I].pos1].Rarray[Rselect[I].pos2].dataarray[Rselect[I].pos3].datatype = 0 then
              WriteRDataInt(@Rfile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[I].pos1].Rarray[Rselect[I].pos2].dataarray[Rselect[I].pos3], ReadRDataInt(@Rfile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[I].pos1].Rarray[Rselect[I].pos2].dataarray[Rselect[I].pos3]) - strtoint64(edit3.Text));
          end;
        3:
          begin
            if Rfile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[I].pos1].Rarray[Rselect[I].pos2].dataarray[Rselect[I].pos3].datatype = 0 then
              WriteRDataInt(@Rfile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[I].pos1].Rarray[Rselect[I].pos2].dataarray[Rselect[I].pos3], ReadRDataInt(@Rfile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[I].pos1].Rarray[Rselect[I].pos2].dataarray[Rselect[I].pos3]) * strtoint64(edit3.Text));
          end;
        4:
          begin
            if Rfile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[I].pos1].Rarray[Rselect[I].pos2].dataarray[Rselect[I].pos3].datatype = 0 then
              WriteRDataInt(@Rfile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[I].pos1].Rarray[Rselect[I].pos2].dataarray[Rselect[I].pos3], ReadRDataInt(@Rfile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[I].pos1].Rarray[Rselect[I].pos2].dataarray[Rselect[I].pos3]) div strtoint64(edit3.Text));
          end;
      end;
    end;
  end;
  temp := combobox2.ItemIndex;
  if (RFile.Rtype[combobox1.ItemIndex].namepos >= 0) and (RFile.Rtype[combobox1.ItemIndex].namepos < RFile.Rtype[combobox1.ItemIndex].Rdata[temp].num) then
    combobox2.Items.Strings[temp] := inttostr(temp) + readRDatastr(@RFile.Rtype[combobox1.ItemIndex].Rdata[temp].Rdataline[RFile.Rtype[combobox1.ItemIndex].namepos].Rarray[0].dataarray[0]);
  combobox2.ItemIndex := temp;
  displayR;
end;

procedure TForm5.Button11Click(Sender: TObject);
var
  filename: string;
  i1,i2,i3,i4,i5: integer;
  temp, temp2: integer;
  //XLSReadWriteII41: TXLSReadWriteII4;
  xls: TXlsFile;
begin

    savedialog1.Filter := 'excel�ļ�|*.xlsx';
    if savedialog1.Execute then
    begin
      try
//      XLSReadWriteII41 := TXLSReadWriteII4.Create(self);
      filename := savedialog1.FileName;
      if not SameText(ExtractFileExt(FileName), '.xlsx') then
        FileName := FileName + '.xlsx';
//
//      XLSReadWriteII41.Clear;
//      XLSReadWriteII41.Filename := Filename;
  //ExcelApp.WorkSheets[2].name := '��Ʒ';
  //ExcelApp.Cells[1,4].Value := '��һ�е�����';
  xls := TXlsFile.Create(1, TExcelFileFormat.v2019, true);

  for i1 := 0 to RFile.typenumber - 1 do
  begin
//    if I1 >= XLSReadWriteII41.Sheets.Count then
//      XLSReadWriteII41.Sheets.Add(WTSHEET);
//    XLSReadWriteII41.Sheets[i1].Name := displaystr(typename[i1]);
   // ExcelApp.WorkSheets[i1 + 1].name := typename[i1];
   // ExcelApp.workSheets[i1 + 1].activate;
     xls.AddSheet;
     xls.ActiveSheet:=i1+1;
     xls.SheetName := typename[i1];
    temp := 0;
    if i1 = 0 then
    begin

      temp2 := 0;
      for i2 := 0 to typedataitem[i1] - 1 do
         if Rini[i1].Rterm[i2].datanum > 0 then
            inc(temp2, Rini[i1].Rterm[i2].datanum * Rini[i1].Rterm[i2].incnum);
     // XLSReadWriteII41.Sheets[i1].DrawingObjects.Notes.Add.CellCol := RFIle.Rtype[i1].datanum + 1;
     // XLSReadWriteII41.Sheets[i1].DrawingObjects.Notes.Add.CellRow := temp2;

      for i2 := 0 to typedataitem[i1] - 1 do
        if Rini[i1].Rterm[i2].datanum > 0 then
          for i3 := 0 to Rini[i1].Rterm[i2].datanum - 1 do
            for i4 := 0 to Rini[i1].Rterm[i2].incnum - 1 do
            begin
            //  XLSReadWriteII41.Sheets[i1].DrawingObjects.Notes.Add.CellCol := 0;
            //  XLSReadWriteII41.Sheets[i1].DrawingObjects.Notes.Add.CellRow := temp;

              if i3 > 0 then
              begin
              xls.SetCellValue(temp+1,1, displaystr(Rini[i1].Rterm[i2 + i4].name + inttostr(i3)));
                //XLS.Sheets[i1].DrawingObjects.Notes.Add.Text := Rini[i1].Rterm[i2 + i4].name + inttostr(i3);
//                XLSReadWriteII41.Sheets[i1].AsString[0,temp] := displaystr(Rini[i1].Rterm[i2 + i4].name + inttostr(i3));
              end
              else
              begin
              xls.SetCellValue(temp+1,1, displaystr(Rini[i1].Rterm[i2 + i4].name));
               // XLS.Sheets[i1].DrawingObjects.Notes.Add.Text := Rini[i1].Rterm[i2 + i4].name;
//                XLSReadWriteII41.Sheets[i1].AsString[0, temp] := displaystr(Rini[i1].Rterm[i2 + i4].name);
              end;
              inc(temp);
            end;

      for i2 := 0 to RFile.Rtype[i1].datanum - 1 do
      begin
        temp := 0;
        for i3 := 0 to RFile.Rtype[i1].Rdata[i2].num - 1 do
        begin
          for I4 := 0 to RFile.Rtype[i1].Rdata[i2].Rdataline[i3].len - 1 do
            for i5 := 0 to RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].incnum - 1 do
            begin
              if RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5].datatype = 1 then
              xls.SetCellValue(temp+1,i2+2, displaystr(readRDataStr(@RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5])))
//                XLSReadWriteII41.Sheets[i1].AsString[i2 + 1, temp] := displaystr(readRDataStr(@RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5]))
              else
              xls.SetCellValue(temp+1,i2+2, readRDataInt(@RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5]));
//                XLSReadWriteII41.Sheets[i1].Asinteger[i2 + 1, temp] := readRDataInt(@RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5]);
              inc(temp);
            end;
        end;
      end;

    end
    else
    begin

      temp2 := 0;
      for i2 := 0 to typedataitem[i1] - 1 do
         if Rini[i1].Rterm[i2].datanum > 0 then
            inc(temp2, Rini[i1].Rterm[i2].datanum * Rini[i1].Rterm[i2].incnum);
     // XLSReadWriteII41.Sheets[i1].DrawingObjects.Notes.Add.CellCol := RFIle.Rtype[i1].datanum + 1;
     // XLSReadWriteII41.Sheets[i1].DrawingObjects.Notes.Add.CellRow := temp2;

      for i2 := 0 to typedataitem[i1] - 1 do
      begin
        if Rini[i1].Rterm[i2].datanum > 0 then
          for i3 := 0 to Rini[i1].Rterm[i2].datanum - 1 do
            for i4 := 0 to Rini[i1].Rterm[i2].incnum - 1 do
            begin
              //XLS.Sheet[i1].InsertColumns(temp, 1);
              if i3 > 0 then
              begin
              xls.SetCellValue(1,temp+1,displaystr(Rini[i1].Rterm[i2 + i4].name + inttostr(i3)))
//                XLSReadWriteII41.Sheets[i1].AsString[temp, 0] := displaystr(Rini[i1].Rterm[i2 + i4].name + inttostr(i3));
              end
              else
              xls.SetCellValue(1,temp+1,displaystr(Rini[i1].Rterm[i2 + i4].name));
//                XLSReadWriteII41.Sheets[i1].AsString[temp, 0] := displaystr(Rini[i1].Rterm[i2 + i4].name);
              inc(temp);

            end;

      end;



      for i2 := 0 to RFIle.Rtype[i1].datanum - 1 do
      begin
        //XLS.Sheet[i1].InsertRows(i2 + 1, 1);
        temp := 0;
        for i3 := 0 to RFile.Rtype[i1].Rdata[i2].num - 1 do
          for I4 := 0 to RFile.Rtype[i1].Rdata[i2].Rdataline[i3].len - 1 do
            for i5 := 0 to RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].incnum - 1 do
            begin
              if RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5].datatype = 1 then
              xls.SetCellValue(i2+2,temp+1,displaystr(readRDataStr(@RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5])))
//                XLSReadWriteII41.Sheets[i1].AsString[temp, i2 + 1]:= displaystr(readRDataStr(@RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5]))
              else
              xls.SetCellValue(i2+2,temp+1,readRDataInt(@RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5]));
//                XLSReadWriteII41.Sheets[i1].Asinteger[temp, i2 + 1] := readRDataInt(@RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5]);
              inc(temp);
            end;
      end;
    end;

  end;
//    XLSReadWriteII41.Write;
//    XLSReadWriteII41.Free;
  //ExcelApp:=Unassigned;
  xls.Save(filename);
        showmessage('����Excel�ɹ���');
      except
        showmessage('����Excel����');
        exit;
      end;
    end;

end;

procedure TForm5.Button12Click(Sender: TObject);
var
  i1,i2,i3,i4,i5: integer;
  temp: integer;
//  XLSReadWriteII41 : TXLSReadWriteII4;
xls: TXlsFile;
xf:integer;
   cell: TCellValue;
begin

    opendialog1.Filter := 'excel����ļ�|*.xlsx';
    if opendialog1.Execute then
    begin
      try
//      XLSReadWriteII41 := TXLSReadWriteII4.Create(self);
//      XLSReadWriteII41.Clear;
//      XLSReadWriteII41.Filename := opendialog1.Filename;
//      XLSReadWriteII41.Read;
      xls := TXlsFile.Create (opendialog1.Filename);
      RFile.typenumber := typenumber;
      for i1 := 0 to RFile.typenumber - 1 do
      begin
        xls.ActiveSheetByName:=typename[i1];

        if i1 = 0 then
        begin

          i2 := 1;
          //while True do
          //begin
//            if XLSReadWriteII41.Sheets[i1].AsString[i2,0] = '' then
//              break;
            //inc(i2);
          //end;
          i2:=xls.ColCount;
          RFile.Rtype[i1].datanum := 0;
          setlength(Rfile.Rtype[i1].Rdata, RFile.Rtype[i1].datanum);

          for I3 := 0 to i2 - 2 do
            AddNewRData(@RFile, i1, nil);

          for i2 := 0 to RFile.Rtype[i1].datanum - 1 do
          begin
            //RFile.Rtype[i1].Rdata[i2].num := temp;
            //setlength(RFile.Rtype[i1].Rdata[i2].Rdataline, temp);
            temp := 0;
            for I3 := 0 to typedataitem[i1] - 1 do
            begin
              if Rini[i1].Rterm[i3].datanum > 0 then
              begin
                //RFIle.Rtype[i1].Rdata[i2].Rdataline[temp].len := Rini[i1].Rterm[i3].datanum;
                //setlength(RFile.Rtype[i1].Rdata[i2].Rdataline[temp].Rarray, Rini[i1].Rterm[i3].datanum);
                //setlength(Rfile[i1].Rdata[i2].Rdataline[i3].datatype, Rini[i1].Rterm[i3].incnum);
                //setlength(Rfile[i1].Rdata[i2].Rdataline[i3].Rarray, Rini[i1].Rterm[i3].incnum);
                for I4 := 0 to Rini[i1].Rterm[i3].datanum - 1 do
                begin
                  //RFile.Rtype[i1].Rdata[i2].Rdataline[temp].Rarray[i4].incnum :=  Rini[i1].Rterm[i3].incnum;
                  //setlength(RFile.Rtype[i1].Rdata[i2].Rdataline[temp].Rarray[i4].dataarray, Rini[i1].Rterm[i3].incnum);
                  for i5 := 0 to Rini[i1].Rterm[i3].incnum - 1 do
                  begin
                    //RFile.Rtype[i1].Rdata[i2].Rdataline[temp].Rarray[i4].dataarray[i5].datatype := Rini[i1].Rterm[i3 + i5].isstr;
                    //RFile.Rtype[i1].Rdata[i2].Rdataline[temp].Rarray[i4].dataarray[i5].datalen := Rini[i1].Rterm[i3 + i5].datalen;
                    //setlength(Rfile[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5].str, Rini[i1].Rterm[i3 + i5].datalen);
                    //fileread(F, Rfile[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5].str[0], Rini[i1].Rterm[i3 + i5].datalen);
                    //setlength(RFile.Rtype[i1].Rdata[i2].Rdataline[temp].Rarray[i4].dataarray[i5].str,Rini[i1].Rterm[i3 + i5].datalen);
//                    WriteRDataStr(@RFile.Rtype[i1].Rdata[i2].Rdataline[I3].Rarray[i4].dataarray[i5], displaybackstr(XLSReadWriteII41.Sheets[i1].AsString[i2 + 1, temp]));
                    //Rfile[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5].str := TtoS(Rfile[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5].str);
                    cell := xls.GetCellValueIndexed(temp+1,i2+2, XF);
                    //showmessage(cell.ToSimpleString);
              WriteRDataStr(@RFile.Rtype[i1].Rdata[i2].Rdataline[I3].Rarray[i4].dataarray[i5], displaybackstr(cell.ToSimpleString));
                    inc(temp);
                  end;
                end;
              end;
            end;
          end;


        end
        else
        begin
          i2 := 1;
          //while True do
          //begin
//            if XLSReadWriteII41.Sheets[i1].AsString[0,i2] = '' then
              //break;
            //inc(i2);
          //end;

          RFile.Rtype[i1].datanum := 0;
          setlength(Rfile.Rtype[i1].Rdata, RFile.Rtype[i1].datanum);
          i2 := xls.RowCount;
          for I3 := 0 to i2 - 2 do
            AddNewRData(@RFile, i1, nil);

           for i2 := 0 to RFIle.Rtype[i1].datanum - 1 do
           begin
             //RFIle.Rtype[i1].Rdata[i2].num := temp2;
             //setlength(RFile.Rtype[i1].Rdata[i2].Rdataline, RFIle.Rtype[i1].Rdata[i2].num);
             temp := 0;
             for i3 := 0 to RFile.Rtype[i1].Rdata[i2].num - 1 do
             begin
               //setlength(RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray, Rini[i1].Rterm[i3].datanum);
               //RFile.Rtype[i1].Rdata[i2].Rdataline[i3].len := Rini[i1].Rterm[i3].datanum;
               for I4 := 0 to RFile.Rtype[i1].Rdata[i2].Rdataline[i3].len - 1 do
               begin
                 //RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].incnum := Rini[i1].Rterm[i3].incnum;
                 //setlength(RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray, Rini[i1].Rterm[i3].incnum);
                 for i5 := 0 to RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].incnum - 1 do
                 begin
                   //RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5].datatype := Rini[i1].Rterm[i3 + i5].isstr;
                   //RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5].datalen := Rini[i1].Rterm[i3 + i5].datalen;
//                   WriteRDataStr(@RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5], displaybackstr(XLSReadWriteII41.Sheets[i1].AsString[temp, i2 + 1]));
                   cell := xls.GetCellValueIndexed(i2+2,temp+1, XF);
              WriteRDataStr(@RFile.Rtype[i1].Rdata[i2].Rdataline[I3].Rarray[i4].dataarray[i5], displaybackstr(cell.ToSimpleString));
                   inc(temp);
                 end;
               end;
             end;
          end;

        end;

      end;
      calnamepos(@RFile);
      combobox1.Clear;
      for i1 := 0 to RFile.typenumber - 1 do
        combobox1.Items.Add(typename[i1]);
      combobox1.ItemIndex := 0;
      arrange;
      displayR;
      //excelApp.Quit;
//      XLSReadWriteII41.Free;
      showmessage('����Excel�ɹ���');
      except
        showmessage('����Excel����');
        exit;
      end;
    end;
end;

procedure TForm5.Button1Click(Sender: TObject);
var
  I1, I2: integer;
begin
  //
  if combobox3.itemindex >= 0 then
    if readR(Gamepath + RidxFilename[combobox3.ItemIndex], Gamepath + RFilename[combobox3.ItemIndex], @RFile) then
    begin
      calnamepos(@RFile);
      combobox1.Clear;
      for i1 := 0 to RFile.typenumber - 1 do
        combobox1.Items.Add(DisplayStr(typename[i1]));
      combobox1.ItemIndex := 0;
      arrange;
      displayR;
    end
    else
    begin
      RFile.typenumber := typenumber;
      setlength(RFile.Rtype, RFile.typenumber);
      combobox1.Clear;
      combobox2.Clear;
      for i1 := 0 to RFile.typenumber - 1 do
      begin
        combobox1.Items.Add(DisplayStr(typename[i1]));
        RFile.Rtype[I1].datanum := 0;
        Setlength(RFile.Rtype[I1].Rdata, 0);
      end;
      calnamepos(@RFile);
      combobox1.ItemIndex := 0;
      showmessage('��ȡR�ļ�ʧ�ܣ�');
      arrange;
      displayR;
    end;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
  saveR(Gamepath + RidxFilename[combobox3.ItemIndex], Gamepath + RFilename[combobox3.ItemIndex], @RFile);
  if combobox3.ItemIndex = 0 then
    if readR(gamepath + Ridxfilename[0], gamepath + Rfilename[0], @useR) then
      calnamepos(@useR);
end;

procedure TForm5.Button3Click(Sender: TObject);
var
  temp: integer;
begin
  if MessageBox(Self.Handle, '�Ƿ���������Ե�ǰֵΪȱʡֵ��',  '�������', MB_OKCANCEL) = 1 then
  begin
    AddnewRData(@RFIle, combobox1.ItemIndex, nil);
    if RFIle.Rtype[combobox1.ItemIndex].datanum > 1 then
    begin
      copyRdata(@(RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex]), @(RFile.Rtype[combobox1.ItemIndex].Rdata[RFIle.Rtype[combobox1.ItemIndex].datanum - 1]));
    end;
    arrange;
    combobox2.ItemIndex := RFIle.Rtype[combobox1.ItemIndex].datanum - 1;
    ComboBox2Select(Sender);
  end;
end;

procedure addnewRdata(PRF: PRFile; CRType: integer; PRD: PRData);
var
  I3, I4, I5, TEMP: integer;
begin

  if PRF.Rtype[CRType].datanum < 0 then
    PRF.Rtype[CRType].datanum := 0;
  Inc(PRF.Rtype[CRType].datanum);
  Setlength(PRF.Rtype[CRType].Rdata, PRF.Rtype[CRType].datanum);

  temp := 0;
  for i3 := 0 to typedataitem[CRType] - 1 do
    if Rini[CRType].Rterm[i3].datanum > 0 then
      inc(temp);
  PRF.Rtype[CRType].Rdata[PRF.Rtype[CRType].datanum - 1].num := temp;
  setlength(PRF.Rtype[CRType].Rdata[PRF.Rtype[CRType].datanum - 1].Rdataline, PRF.Rtype[CRType].Rdata[PRF.Rtype[CRType].datanum - 1].num);

  temp := -1;
  for I3 := 0 to typedataitem[CRType] - 1 do
  begin
    if Rini[CRType].Rterm[i3].datanum > 0 then
    begin
      inc(temp);
      PRF.Rtype[CRType].Rdata[PRF.Rtype[CRType].datanum - 1].Rdataline[temp].len := Rini[CRType].Rterm[i3].datanum;
      setlength(PRF.Rtype[CRType].Rdata[PRF.Rtype[CRType].datanum - 1].Rdataline[temp].Rarray, Rini[CRType].Rterm[i3].datanum);
      for I4 := 0 to Rini[CRType].Rterm[i3].datanum - 1 do
      begin
        PRF.Rtype[CRType].Rdata[PRF.Rtype[CRType].datanum - 1].Rdataline[temp].Rarray[i4].incnum :=  Rini[CRType].Rterm[i3].incnum;
        setlength(PRF.Rtype[CRType].Rdata[PRF.Rtype[CRType].datanum - 1].Rdataline[temp].Rarray[i4].dataarray, PRF.Rtype[CRType].Rdata[PRF.Rtype[CRType].datanum - 1].Rdataline[temp].Rarray[i4].incnum);
        for i5 := 0 to Rini[CRType].Rterm[i3].incnum - 1 do
        begin
          PRF.Rtype[CRType].Rdata[PRF.Rtype[CRType].datanum - 1].Rdataline[temp].Rarray[i4].dataarray[i5].datatype := Rini[CRType].Rterm[i3 + i5].isstr;
          PRF.Rtype[CRType].Rdata[PRF.Rtype[CRType].datanum - 1].Rdataline[temp].Rarray[i4].dataarray[i5].datalen := Rini[CRType].Rterm[i3 + i5].datalen;
          if PRF.Rtype[CRType].Rdata[PRF.Rtype[CRType].datanum - 1].Rdataline[temp].Rarray[i4].dataarray[i5].datalen >= 0 then
            setlength(PRF.Rtype[CRType].Rdata[PRF.Rtype[CRType].datanum - 1].Rdataline[temp].Rarray[i4].dataarray[i5].data, PRF.Rtype[CRType].Rdata[PRF.Rtype[CRType].datanum - 1].Rdataline[temp].Rarray[i4].dataarray[i5].datalen)
          else
          begin
            PRF.Rtype[CRType].Rdata[PRF.Rtype[CRType].datanum - 1].Rdataline[temp].Rarray[i4].dataarray[i5].datalen := 0;
            setlength(PRF.Rtype[CRType].Rdata[PRF.Rtype[CRType].datanum - 1].Rdataline[temp].Rarray[i4].dataarray[i5].data, PRF.Rtype[CRType].Rdata[PRF.Rtype[CRType].datanum - 1].Rdataline[temp].Rarray[i4].dataarray[i5].datalen);
          end;
          if PRF.Rtype[CRType].Rdata[PRF.Rtype[CRType].datanum - 1].Rdataline[temp].Rarray[i4].dataarray[i5].datalen > 0 then
            zeromemory(@PRF.Rtype[CRType].Rdata[PRF.Rtype[CRType].datanum - 1].Rdataline[temp].Rarray[i4].dataarray[i5].data[0], PRF.Rtype[CRType].Rdata[PRF.Rtype[CRType].datanum - 1].Rdataline[temp].Rarray[i4].dataarray[i5].datalen);
        end;
      end;
    end;
  end;

  if PRD <> nil then
    copyRdata(PRD, @PRF.Rtype[CRType].Rdata[PRF.Rtype[CRType].datanum - 1]);

end;

procedure TForm5.Button4Click(Sender: TObject);
var
  temp: integer;
  arrg: boolean;
begin
  if RFile.Rtype[combobox1.ItemIndex].datanum <= 1 then
    showmessage('���ڵ���Ŀ����̫�٣�С��1�����벻Ҫɾ����')
  else
  begin
    if MessageBox(Self.Handle, '�Ƿ�ɾ�����һ�',  'ɾ�����һ��', MB_OKCANCEL) = 1 then
    begin
      temp := combobox2.ItemIndex;
      arrg := false;
      if temp = RFIle.Rtype[combobox1.ItemIndex].datanum - 1 then
        arrg := true;
      dec(RFIle.Rtype[combobox1.ItemIndex].datanum);
      setlength(RFile.Rtype[combobox1.ItemIndex].Rdata, RFIle.Rtype[combobox1.ItemIndex].datanum);
      arrange;
      combobox2.ItemIndex := temp;
      if arrg then
        displayR;
    end;
  end;
end;

procedure TForm5.Button5Click(Sender: TObject);
var
  ExcelApp: Variant;
  I1,i2,i3,i4,i5: integer;
  temp: integer;
begin
  if MessageBox(Self.Handle, '����Excel��Ҫ�����Ѿ���װExcel�����ҵ���ʱ��ϳ����������벻Ҫ���в�����ȷʵҪ������',  '����Excel', MB_OKCANCEL) = 1 then
  BEGIN
  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Caption := 'UPedit����Excel����';
  excelapp.visible := true;
  ExcelApp.WorkBooks.Add;
  //ExcelApp.WorkSheets[2].name := '��Ʒ';
  //ExcelApp.Cells[1,4].Value := '��һ�е�����';

  for i1 := integer(ExcelApp.workSheets.count) to RFile.typenumber - 1 do
  begin
    ExcelApp.workSheets.add;
  end;

  for i1 := 0 to RFile.typenumber - 1 do
  begin
//    ExcelApp.workSheets[i1 + 1].activate;
//    ExcelApp.WorkSheets[i1 + 1].name := displaystr(typename[i1]);

    temp := 1;
    if i1 = 0 then
    begin
      ExcelApp.Caption := 'UPedit����Excel������(' + displaystr(typename[i1]) + ')';
      for i2 := 0 to typedataitem[i1] - 1 do
        if Rini[i1].Rterm[i2].datanum > 0 then
          for i3 := 0 to Rini[i1].Rterm[i2].datanum - 1 do
            for i4 := 0 to Rini[i1].Rterm[i2].incnum - 1 do
            begin
              if i3 > 0 then
              begin
//                ExcelApp.Cells[temp, 1].value := displaystr(Rini[i1].Rterm[i2 + i4].name + inttostr(i3));
              end
              else
//                ExcelApp.Cells[temp, 1].value := displaystr(Rini[i1].Rterm[i2 + i4].name);
              inc(temp);
            end;

      for i2 := 0 to RFIle.Rtype[i1].datanum - 1 do
      begin
        ExcelApp.Caption := 'UPedit����Excel������(' + displaystr(typename[i1]) + ':' + inttostr(i2 + 1) + '/' + inttostr(RFIle.Rtype[i1].datanum) + ')';
        temp := 1;
        for i3 := 0 to RFile.Rtype[i1].Rdata[i2].num - 1 do
          for I4 := 0 to RFile.Rtype[i1].Rdata[i2].Rdataline[i3].len - 1 do
            for i5 := 0 to RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].incnum - 1 do
            begin
//              excelApp.Cells[temp, i2 + 2].value := displaystr(readRDataStr(@RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5]));
              inc(temp);
            end;
      end;
    end
    else
    begin
      ExcelApp.Caption := 'UPedit����Excel������(' + displaystr(typename[i1]) + ')';
      for i2 := 0 to typedataitem[i1] - 1 do
        if Rini[i1].Rterm[i2].datanum > 0 then
          for i3 := 0 to Rini[i1].Rterm[i2].datanum - 1 do
            for i4 := 0 to Rini[i1].Rterm[i2].incnum - 1 do
            begin
              if i3 > 0 then
              begin
//                ExcelApp.Cells[1, temp].value := displaystr(Rini[i1].Rterm[i2 + i4].name + inttostr(i3));
              end
              else
//                ExcelApp.Cells[1, temp].value := displaystr(Rini[i1].Rterm[i2 + i4].name);
              inc(temp);
            end;
      for i2 := 0 to RFIle.Rtype[i1].datanum - 1 do
      begin
        ExcelApp.Caption := 'UPedit����Excel������(' + displaystr(typename[i1]) + ':' + inttostr(i2 + 1) + '/' + inttostr(RFIle.Rtype[i1].datanum) + ')';
        temp := 1;
        for i3 := 0 to RFile.Rtype[i1].Rdata[i2].num - 1 do
          for I4 := 0 to RFile.Rtype[i1].Rdata[i2].Rdataline[i3].len - 1 do
            for i5 := 0 to RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].incnum - 1 do
            begin
//              excelApp.Cells[i2 + 2, temp].value := displaystr(readRDatastr(@RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5]));
              inc(temp);
            end;
      end;
    end;
  end;
    ExcelApp.Caption := 'UPedit����Excel��ɣ�';
    ExcelApp := Unassigned;
    SetForegroundWindow(application.Handle);
    showmessage('����Excel��ɣ��뵽Excel�����б����ļ���');
  END;
end;

procedure TForm5.Button6Click(Sender: TObject);
var
  ExcelApp: Variant;
  I1,i2,i3,i4,i5: integer;
  temp, temp2: integer;
begin
  if MessageBox(Self.Handle, '����Excel��Ҫ�����Ѿ���װExcel�����ҵ���ʱ��ϳ����������벻Ҫ���в�����ȷʵҪ������',  '����Excel', MB_OKCANCEL) = 1 then
  begin
    opendialog1.Filter := 'excel����ļ�|*.xls;*.xlsx';
    if opendialog1.Execute then
    begin
      ExcelApp := CreateOleObject('Excel.Application');
      ExcelApp.Caption := 'UPedit����Excel����';
      excelapp.visible := true;
      //ExcelApp.WorkBooks.Add;
      ExcelApp.WorkBooks.Open( opendialog1.FileName );

      //ExcelApp.WorkSheets[2].name := '��Ʒ';
      //ExcelApp.Cells[1,4].Value := '��һ�е�����';
      RFile.typenumber := typenumber;
      for i1 := 0 to RFile.typenumber - 1 do
      begin
        //ExcelApp.WorkSheets[i1 + 1].name := typename[i1];
//        ExcelApp.workSheets[i1 + 1].activate;
        ExcelApp.Caption := 'UPedit����Excel������(' + displaystr(typename[i1]) + ')';
        if i1 = 0 then
        begin

          i2 := 2;
          while True do
          begin
//            if String(excelApp.Cells[1, i2].value) = '' then
              break;
            inc(i2);
          end;

          RFile.Rtype[i1].datanum := 0;
          setlength(Rfile.Rtype[i1].Rdata, RFile.Rtype[i1].datanum);

          for i3 := 1 to i2 - 2 do
          begin
            AddNewRData(@Rfile, i1, nil);
          end;

          //setlength(Rfile.Rtype[i1].Rdata, RFile.Rtype[i1].datanum);
          for i2 := 0 to RFile.Rtype[i1].datanum - 1 do
          begin
            ExcelApp.Caption := 'UPedit����Excel������(' + displaystr(typename[i1]) + ':' + inttostr(i2 + 1) + '/' + inttostr(RFIle.Rtype[i1].datanum) + ')';
            //temp := 0;
            //for i3 := 0 to typedataitem[i1] - 1 do
              //if Rini[i1].Rterm[i3].datanum > 0 then
                //inc(temp);
            //RFile.Rtype[i1].Rdata[i2].num := temp;
            //setlength(RFile.Rtype[i1].Rdata[i2].Rdataline, temp);
            temp := 0;
            for I3 := 0 to typedataitem[i1] - 1 do
            begin
              if Rini[i1].Rterm[i3].datanum > 0 then
              begin
                //RFIle.Rtype[i1].Rdata[i2].Rdataline[temp].len := Rini[i1].Rterm[i3].datanum;
                //setlength(RFile.Rtype[i1].Rdata[i2].Rdataline[temp].Rarray, Rini[i1].Rterm[i3].datanum);
                //setlength(Rfile[i1].Rdata[i2].Rdataline[i3].datatype, Rini[i1].Rterm[i3].incnum);
                //setlength(Rfile[i1].Rdata[i2].Rdataline[i3].Rarray, Rini[i1].Rterm[i3].incnum);
                for I4 := 0 to Rini[i1].Rterm[i3].datanum - 1 do
                begin
                  //RFile.Rtype[i1].Rdata[i2].Rdataline[temp].Rarray[i4].incnum :=  Rini[i1].Rterm[i3].incnum;
                  //setlength(RFile.Rtype[i1].Rdata[i2].Rdataline[temp].Rarray[i4].dataarray, Rini[i1].Rterm[i3].incnum);
                  for i5 := 0 to Rini[i1].Rterm[i3].incnum - 1 do
                  begin
                    //RFile.Rtype[i1].Rdata[i2].Rdataline[temp].Rarray[i4].dataarray[i5].datatype := Rini[i1].Rterm[i3 + i5].isstr;
                    //RFile.Rtype[i1].Rdata[i2].Rdataline[temp].Rarray[i4].dataarray[i5].datalen := Rini[i1].Rterm[i3 + i5].datalen;
                    if RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5].datatype = 0 then
                    begin
                      //fileread(F, PRF.Rtype[i1].Rdata[i2].Rdataline[temp].Rarray[i4].dataarray[i5].number, Rini[i1].Rterm[i3 + i5].datalen)
                      try
//                        WriteRDataInt(@RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5], strtoint64(string(excelApp.Cells[temp + 1, i2 + 2].value)));
                      except
                        WriteRDataInt(@RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5], 0);
                      end;
                    end
                    else
                    begin
                      //setlength(Rfile[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5].str, Rini[i1].Rterm[i3 + i5].datalen);
                      //fileread(F, Rfile[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5].str[0], Rini[i1].Rterm[i3 + i5].datalen);
                      //setlength(RFile.Rtype[i1].Rdata[i2].Rdataline[temp].Rarray[i4].dataarray[i5].str,Rini[i1].Rterm[i3 + i5].datalen);
//                      WriteRDataStr(@RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5], displaybackstr(excelApp.Cells[temp + 1, i2 + 2].value));
                      //Rfile[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5].str := TtoS(Rfile[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5].str);
                    end;
                    inc(temp);
                  end;
                end;

              end;
            end;
          end;


        end
        else
        begin

          i2 := 2;
          while True do
          begin
//            if string(excelApp.cells[i2, 1].value) = '' then
//              break;
            inc(i2);
          end;

          RFile.Rtype[i1].datanum := 0;
          setlength(Rfile.Rtype[i1].Rdata, RFile.Rtype[i1].datanum);

          for i3 := 1 to i2 - 2 do
          begin
            AddNewRData(@Rfile, i1, nil);
          end;

           for i2 := 0 to RFIle.Rtype[i1].datanum - 1 do
           begin
             ExcelApp.Caption := 'UPedit����Excel������(' + displaystr(typename[i1]) + ':' + inttostr(i2 + 1) + '/' + inttostr(RFIle.Rtype[i1].datanum) + ')';

             //temp2 := 0;
             //for i3 := 0 to typedataitem[i1] - 1 do
               //if Rini[i1].Rterm[i3].datanum > 0 then
                 //inc(temp2);
             //RFIle.Rtype[i1].Rdata[i2].num := temp2;
             //setlength(RFile.Rtype[i1].Rdata[i2].Rdataline, RFIle.Rtype[i1].Rdata[i2].num);
             temp := 0;
             for i3 := 0 to RFile.Rtype[i1].Rdata[i2].num - 1 do
             begin
               //setlength(RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray, Rini[i1].Rterm[i3].datanum);
               //RFile.Rtype[i1].Rdata[i2].Rdataline[i3].len := Rini[i1].Rterm[i3].datanum;
               for I4 := 0 to RFile.Rtype[i1].Rdata[i2].Rdataline[i3].len - 1 do
               begin
                 //RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].incnum := Rini[i1].Rterm[i3].incnum;
                 //setlength(RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray, Rini[i1].Rterm[i3].incnum);
                 for i5 := 0 to RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].incnum - 1 do
                 begin
                   //RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5].datatype := Rini[i1].Rterm[i3 + i5].isstr;
                   //RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5].datalen := Rini[i1].Rterm[i3 + i5].datalen;
                   if RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5].datatype = 1 then
//                     WriteRDataStr(@RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5], displaybackstr(excelApp.Cells[i2 + 2, temp + 1].value))
                   else
                   begin
                     //edit4.Text := inttostr(i1) + ' ' + inttostr(i2) + ' ' + inttostr(i3) + ' ' + inttostr(i4) + ' ' + inttostr(i5) + ' '+ inttostr(temp2)+ ' ' + inttostr(typenumber);
                     try
//                       WriteRDataInt(@RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5], strtoint64(string(excelApp.Cells[i2 + 2, temp + 1].value)));
                     except
                       WriteRDataInt(@RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5], 0);
                     end;
                   end;
                   inc(temp);
                 end;
               end;
             end;
          end;



     { for i2 := 0 to RFIle.Rtype[i1].datanum - 1 do
      begin
        temp := 1;
        for i3 := 0 to RFile.Rtype[i1].Rdata[i2].num - 1 do
          for I4 := 0 to RFile.Rtype[i1].Rdata[i2].Rdataline[i3].len - 1 do
            for i5 := 0 to RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].incnum - 1 do
            begin
              if RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5].datatype = 1 then
                excelApp.Cells[i2 + 2, temp].value := string(RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5].str)
              else
                excelApp.Cells[i2 + 2, temp].value := inttostr(RFile.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5].number);
              inc(temp);
            end;
      end;
    end;  }
        end;

      end;
      ExcelApp.Caption := 'UPedit����Excel��ɣ�';
      ExcelApp := Unassigned;
      calnamepos(@RFile);
      combobox1.Clear;
      for i1 := 0 to RFile.typenumber - 1 do
        combobox1.Items.Add(typename[i1]);
      combobox1.ItemIndex := 0;
      arrange;
      displayR;
      //excelApp.Quit;
      SetForegroundWindow(application.Handle);
      showmessage('����Excel��ɣ�');
    end;
  end;
end;

procedure TForm5.Button7Click(Sender: TObject);
var
  I: integer;
begin
  checklistbox1.DoubleBuffered := false;
  for I := 0 to length(Rselect) - 1 do
    checklistbox1.Checked[I] := true;
  checklistbox1.DoubleBuffered := true;
end;

procedure TForm5.Button8Click(Sender: TObject);
var
  I: integer;
begin
  checklistbox1.DoubleBuffered := false;
  for I := 0 to length(Rselect) - 1 do
    checklistbox1.Checked[I] := false;
  checklistbox1.DoubleBuffered := true;
end;

procedure TForm5.Button9Click(Sender: TObject);
var
  I: integer;
begin
  checklistbox1.DoubleBuffered := false;
  for I := 0 to length(Rselect) - 1 do
   checklistbox1.Checked[I] := not(checklistbox1.Checked[I]);
  checklistbox1.DoubleBuffered := true;
end;

procedure TForm5.ComboBox1Change(Sender: TObject);
begin
  arrange;
  displayR;
end;

procedure TForm5.ComboBox2Select(Sender: TObject);
begin
  if combobox2.ItemIndex >= 0 then
    displayR;
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  setlength(RFile.Rtype,0);
  CForm5 := true;
  action := cafree;
end;

procedure TForm5.FormCreate(Sender: TObject);
var
  I1: integer;
begin
  for i1 := 0 to RFilenum - 1 do
  begin
    combobox3.Items.Add(displayStr(RFilenote[i1]));
  end;
  combobox3.ItemIndex := 0;
  button1click(sender);
  statusbar1.Canvas.Brush.Style := bsclear;
  statusbar1.Canvas.Font.Color := clblack;
  statusbar1.Canvas.Font.Size := 10;
end;

procedure TForm5.FormResize(Sender: TObject);
begin
  checklistbox1.Columns := checklistbox1.Width div 300 +1;
end;

procedure TForm5.RadioButton1Click(Sender: TObject);
begin
  RadioButton1.Checked := true;
  RadioButton2.Checked := false;
end;

procedure TForm5.checklistbox1Click(Sender: TObject);
begin
  if (checklistbox1.ItemIndex < length(Rselect)) and (checklistbox1.ItemIndex >= 0) then
  begin
   // edit1.Text := inttostr(length(Rselect)) + ' ' + inttostr(checklistbox1.ItemIndex);
    statusbar1.Canvas.Brush.Color := clbtnface;
    statusbar1.Canvas.FillRect(statusbar1.Canvas.ClipRect);
    statusbar1.Repaint;
    statusbar1.Canvas.TextOut(5,5,Rselect[checklistbox1.ItemIndex].note);
  end;
  //checkListBox1.Repaint;
end;

procedure TForm5.checklistbox1DblClick(Sender: TObject);
var
  i, temp, temp2: integer;
  tempstr: string;
begin
  if (checklistbox1.ItemIndex < length(Rselect)) and (checklistbox1.ItemIndex >= 0) then
  begin
    temp := checklistbox1.ItemIndex;
    if Rselect[checklistbox1.ItemIndex].quote < 0 then
    begin
      if RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3].datatype = 0 then
        WriteRDataInt(@RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3], strtoint64(InputBox('�޸�','�޸Ĵ�����ֵ', inttostr(ReadRDataInt(@RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3])))))
      else
      begin
        WriteRDataStr(@RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3] ,displaybackstr(InputBox('�޸�','�޸Ĵ����ַ���', displaystr(readRDataStr(@RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3])))));
        //showmessage(inttostr(length(tempstr)));
        //Setlength(RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3].str, RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3].datalen + 2);
        //RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3].str := tempstr;
        //Setlength(RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3].str, RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3].datalen + 2);
        //copymemory(pointer(RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3].str))
        //if sizeof(tempstr) < RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3].datalen then
          //zeromemory((pbyte(RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3].str) + sizeof(tempstr)), RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3].datalen - sizeof(tempstr));
        //zeromemory((pbyte(RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3].str) + RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3].datalen), 2);

        //showmessage(inttostr(RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3].datalen));
        //fillchar(RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3].str, RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3].datalen + 2, #0);
        //RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3].str := writeinstr(displaybackstr(InputBox('�޸�','�޸Ĵ����ַ���', displaystr(readoutstr(RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3].str)))));
        //Setlength(RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3].str, RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3].datalen + 2);
        //RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3].str[RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3].datalen + 1] := #0;
        //RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3].str[RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3].datalen + 2] := #0;
      end;
    end
    else
    begin
      Form6.ComboBox1.Clear;
      Form6.ComboBox1.Items.Add('-1');
      for I := 0 to RFile.Rtype[Rselect[checklistbox1.ItemIndex].quote].datanum - 1 do
        Form6.ComboBox1.Items.Add(displaystr(inttostr(I) + readRDatastr(@RFile.Rtype[Rselect[checklistbox1.ItemIndex].quote].Rdata[I].Rdataline[RFile.Rtype[Rselect[checklistbox1.ItemIndex].quote].namepos].Rarray[0].dataarray[0])));
      Form6.ComboBox1.ItemIndex := ReadRDataInt(@RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3]) + 1;
      Form6.Label1.Caption := typename[Rselect[checklistbox1.ItemIndex].quote];
      Reditresult := Form6.ShowModal;
      if reditresult = mrOK then
        WriteRDataInt(@RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[Rselect[checklistbox1.ItemIndex].pos1].Rarray[Rselect[checklistbox1.ItemIndex].pos2].dataarray[Rselect[checklistbox1.ItemIndex].pos3], Form6.ComboBox1.ItemIndex - 1);
      //Form6.Free;
    end;
    //displayR;
    changeRitem(temp, Rselect[temp].pos1,Rselect[temp].pos2,Rselect[temp].pos3);
    temp2 := combobox2.ItemIndex;
    if RFile.Rtype[combobox1.ItemIndex].namepos = Rselect[temp].pos1 then
    begin
      combobox2.Items.Strings[temp2] := inttostr(temp2) + ReadRDataStr(@RFile.Rtype[combobox1.ItemIndex].Rdata[temp2].Rdataline[Rselect[temp].pos1].Rarray[0].dataarray[0]);
    end;
    combobox2.ItemIndex := temp2;
    //checklistbox1.ItemIndex := temp;
  end;
end;

function readR(idx, grp: string; PRF: PRFile): boolean;
var
  offset: array of integer;
  I, i1,i2,i3,i4,i5: integer;
  size, F, temp, templen: Integer;
begin
  result := false;
  if fileexists(idx) and fileexists(grp) then
  begin
    try
      PRF.typenumber := typenumber;
      setlength(PRF.Rtype, PRF.typenumber);
      for I := 0 to PRF.typenumber - 1 do
      begin
        PRF.Rtype[I].datanum := 0;
        PRF.Rtype[I].namepos := -1;
        PRF.Rtype[I].mappos := -1;
        setlength(PRF.Rtype[I].Rdata, 0);
      end;
      F := fileopen(idx, fmopenread);
      setlength(offset, PRF.typenumber);
      fileread(F, offset[0], PRF.typenumber * 4);
      fileclose(F);

      F := fileopen(grp, fmopenread);

      for i1 := 0 to PRF.typenumber - 1 do
      begin
        PRF.Rtype[i1].namepos := -1;
        size := 0;
        for i2 := 0 to typedataitem[i1] - 1 do
        begin
          if Rini[i1].Rterm[i2].datanum > 0 then
            for I3 := 0 to Rini[i1].Rterm[i2].incnum - 1 do
            begin
              inc(size, Rini[i1].Rterm[i2].datanum * Rini[i1].Rterm[i2 + I3].datalen);
            end;
        end;
        if i1 = 0 then
        begin
          templen := max(offset[i1] div size, 1);
        end
        else
          templen := max((offset[i1] - offset[i1 - 1]) div size, 1);
        for i2 := 0 to templen - 1 do
        begin
          AddNewRData(PRF, i1, nil);
        end;

        if i1 <> 0 then
          fileseek(F, offset[i1 - 1], 0);
        //setlength(PRF.Rtype[i1].Rdata, PRF.Rtype[i1].datanum);
        for i2 := 0 to PRF.Rtype[i1].datanum - 1 do
        begin
          //temp := 0;
          //for i3 := 0 to typedataitem[i1] - 1 do
            //if Rini[i1].Rterm[i3].datanum > 0 then
              //inc(temp);
          //PRF.Rtype[i1].Rdata[i2].num := temp;
          //setlength(PRF.Rtype[i1].Rdata[i2].Rdataline, temp);
          temp := -1;
          for I3 := 0 to typedataitem[i1] - 1 do
          begin
            if Rini[i1].Rterm[i3].datanum > 0 then
            begin
              inc(temp);
              if (i3 = 0) and (Rini[i1].Rterm[i3].isname = 1) then
                  PRF.Rtype[i1].namepos := temp;

              //PRF.Rtype[i1].Rdata[i2].Rdataline[temp].len := Rini[i1].Rterm[i3].datanum;
              //setlength(PRF.Rtype[i1].Rdata[i2].Rdataline[temp].Rarray, Rini[i1].Rterm[i3].datanum);
              //setlength(Rfile[i1].Rdata[i2].Rdataline[i3].datatype, Rini[i1].Rterm[i3].incnum);
              //setlength(Rfile[i1].Rdata[i2].Rdataline[i3].Rarray, Rini[i1].Rterm[i3].incnum);
              for I4 := 0 to Rini[i1].Rterm[i3].datanum - 1 do
              begin
                //PRF.Rtype[i1].Rdata[i2].Rdataline[temp].Rarray[i4].incnum :=  Rini[i1].Rterm[i3].incnum;
                //setlength(PRF.Rtype[i1].Rdata[i2].Rdataline[temp].Rarray[i4].dataarray, Rini[i1].Rterm[i3].incnum);
                for i5 := 0 to Rini[i1].Rterm[i3].incnum - 1 do
                begin
                  //PRF.Rtype[i1].Rdata[i2].Rdataline[temp].Rarray[i4].dataarray[i5].datatype := Rini[i1].Rterm[i3 + i5].isstr;
                  //PRF.Rtype[i1].Rdata[i2].Rdataline[temp].Rarray[i4].dataarray[i5].datalen := Rini[i1].Rterm[i3 + i5].datalen;
                  //setlength(PRF.Rtype[i1].Rdata[i2].Rdataline[temp].Rarray[i4].dataarray[i5].data, Rini[i1].Rterm[i3 + i5].datalen);
                  if Rini[i1].Rterm[i3 + i5].datalen > 0 then
                    fileread(F, PRF.Rtype[i1].Rdata[i2].Rdataline[temp].Rarray[i4].dataarray[i5].data[0], Rini[i1].Rterm[i3 + i5].datalen);
                end;
              end;

            end;
          end;
        end;
      end;
      fileclose(F);

      result := true;
    except
      exit;
    end;
  end;
end;

procedure TForm5.Edit2KeyPress(Sender: TObject; var Key: Char);
var
NumEdit1: dWord;
begin
   If key=#13 then
   begin
     Button1Click(Sender);
   end else
   begin
     NumEdit1 := GetWindowLong(Edit2.Handle, GWL_STYLE);
     SetWindowLong(Edit2.Handle, GWL_STYLE, NumEdit1 or ES_NUMBER);
   end;
end;

procedure TForm5.changeRitem(idxnum, pos1,pos2,pos3: integer);
var
  i: integer;
  tempstr: string;
begin
  tempstr := '';
  for i := checklistbox1.Canvas.TextWidth(DisplayStr(Rselect[idxnum].name)) div checklistbox1.Canvas.TextWidth(' ') to 30 do
    tempstr := tempstr + ' ';
  if RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[pos1].Rarray[pos2].dataarray[pos3].datatype = 0 then
  begin
    if (Rselect[idxnum].quote < 0) or (ReadRDataInt(@RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[pos1].Rarray[pos2].dataarray[pos3]) < 0) or (ReadRDataInt(@RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[pos1].Rarray[pos2].dataarray[pos3]) >= RFile.Rtype[Rselect[idxnum].quote].datanum) then
      checklistbox1.Items.Strings[idxnum] := (displaystr(Rselect[idxnum].name) + tempstr + inttostr(ReadRDataInt(@RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[pos1].Rarray[pos2].dataarray[pos3])))
    else
      checklistbox1.Items.Strings[idxnum] := (displaystr(Rselect[idxnum].name + tempstr + inttostr(ReadRDataInt(@RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[pos1].Rarray[pos2].dataarray[pos3])) + readRDataStr(@RFile.Rtype[Rselect[idxnum].quote].Rdata[ReadRDataInt(@RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[pos1].Rarray[pos2].dataarray[pos3])].Rdataline[RFile.Rtype[Rselect[idxnum].quote].namepos].Rarray[0].dataarray[0])))
  end
  else
    checklistbox1.Items.Strings[idxnum] := (displaystr((Rselect[idxnum].name) + tempstr + readRDataStr(@RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[pos1].Rarray[pos2].dataarray[pos3])));

end;

procedure TForm5.displayR;
var
  i1,i2,i3, i4, i5, temp, temp2, t1,t2: integer;
  tempstr: string;
begin
  if candisplayR then
  begin
  try
  checklistbox1.Clear;
  temp := 0;
  t1 := combobox1.ItemIndex;
  t2 := combobox2.ItemIndex;
  if (t1 >= 0) and (t2 >= 0) then
  for i1 := 0 to RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].num - 1 do
    inc(temp, RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[i1].len * RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[i1].Rarray[0].incnum);
    setlength(Rselect, temp);
    temp := -1;
    temp2 := 0;
    for i1 := 0 to RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].num - 1 do
    begin
      for i2 := 0 to RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[i1].len - 1 do
      begin
        for I3 := 0 to RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[i1].Rarray[i2].incnum - 1 do
        begin
          tempstr := '';
          i5 := RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[i1].len;
          if i5 <= 1 then
            for i4 := checklistbox1.Canvas.TextWidth(displayStr(Rini[combobox1.ItemIndex].Rterm[temp2 + i3].name)) div checklistbox1.Canvas.TextWidth(' ') to 30 do
              tempstr := tempstr + ' '
          else
            for i4 := checklistbox1.Canvas.TextWidth(displayStr(Rini[combobox1.ItemIndex].Rterm[temp2 + i3].name) + inttostr(i2)) div checklistbox1.Canvas.TextWidth(' ') to 30 do
              tempstr := tempstr + ' ';
          if RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[i1].Rarray[i2].dataarray[i3].datatype = 0 then
          begin
            if i5 <= 1 then
            begin
              if (Rini[combobox1.ItemIndex].Rterm[temp2 + i3].quote < 0) or (ReadRDataInt(@RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[i1].Rarray[i2].dataarray[i3]) < 0) or (ReadRDataInt(@RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[i1].Rarray[i2].dataarray[i3]) >= RFile.Rtype[Rini[combobox1.ItemIndex].Rterm[temp2 + i3].quote].datanum) then
                checklistbox1.Items.Add(displaystr((Rini[combobox1.ItemIndex].Rterm[temp2 + i3].name) + tempstr + inttostr(ReadRDataInt(@RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[i1].Rarray[i2].dataarray[i3]))))
              else
                checklistbox1.Items.Add(displaystr((Rini[combobox1.ItemIndex].Rterm[temp2 + i3].name) + tempstr + inttostr(ReadRDataInt(@RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[i1].Rarray[i2].dataarray[i3])) + ReadRDataStr(@RFile.Rtype[Rini[combobox1.ItemIndex].Rterm[temp2 + i3].quote].Rdata[ReadRDataInt(@RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[i1].Rarray[i2].dataarray[i3])].Rdataline[RFile.Rtype[Rini[combobox1.ItemIndex].Rterm[temp2 + i3].quote].namepos].Rarray[0].dataarray[0])));
            end
            else
            begin
              if (Rini[combobox1.ItemIndex].Rterm[temp2 + i3].quote < 0) or (ReadRDataInt(@RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[i1].Rarray[i2].dataarray[i3]) < 0) or (ReadRDataInt(@RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[i1].Rarray[i2].dataarray[i3]) >= RFile.Rtype[Rini[combobox1.ItemIndex].Rterm[temp2 + i3].quote].datanum) then
              begin
                checklistbox1.Items.Add(displaystr((Rini[combobox1.ItemIndex].Rterm[temp2 + i3].name) + inttostr(i2) + tempstr + inttostr(ReadRDataInt(@RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[i1].Rarray[i2].dataarray[i3]))));
              end
              else
              begin
                checklistbox1.Items.Add(displaystr((Rini[combobox1.ItemIndex].Rterm[temp2 + i3].name) + inttostr(i2) + tempstr + inttostr(ReadRDataInt(@RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[i1].Rarray[i2].dataarray[i3])) + ReadRDataStr(@RFile.Rtype[Rini[combobox1.ItemIndex].Rterm[temp2 + i3].quote].Rdata[ReadRDataInt(@RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[i1].Rarray[i2].dataarray[i3])].Rdataline[RFile.Rtype[Rini[combobox1.ItemIndex].Rterm[temp2 + i3].quote].namepos].Rarray[0].dataarray[0])));
              end;
            end;
          end
          else
          begin
            if i5 <= 1 then
              checklistbox1.Items.Add(displaystr((Rini[combobox1.ItemIndex].Rterm[temp2 + i3].name) + tempstr + readRdataStr(@RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[i1].Rarray[i2].dataarray[i3])))
              //checklistbox1.Items.Add(Rini[combobox1.ItemIndex].Rterm[temp2 + i3].name + '          ' + (Pstring(@(RFile[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[i1].Rarray[i2].dataarray[i3].str[0])))^);        i4 := 2;
            else
              checklistbox1.Items.Add(displaystr((Rini[combobox1.ItemIndex].Rterm[temp2 + i3].name) + inttostr(i2) + tempstr + readRdataStr(@RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[i1].Rarray[i2].dataarray[i3])))
          end;
          inc(temp);
          Rselect[temp].pos1 := i1;
          Rselect[temp].pos2 := i2;
          Rselect[temp].pos3 := i3;
          Rselect[temp].name := Rini[combobox1.ItemIndex].Rterm[temp2 + i3].name;
          if i5 > 1 then
            Rselect[temp].name := Rselect[temp].name + inttostr(i2);
          Rselect[temp].quote := Rini[combobox1.ItemIndex].Rterm[temp2 + i3].quote;
          Rselect[temp].note := Rini[combobox1.ItemIndex].Rterm[temp2 + i3].note;
        end;
      end;
      inc(temp2,RFile.Rtype[combobox1.ItemIndex].Rdata[combobox2.ItemIndex].Rdataline[i1].Rarray[0].incnum);
    end;
    except

    end;
  end;
end;

procedure TForm5.Edit1KeyPress(Sender: TObject; var Key: Char);
var
NumEdit1: dWord;
begin
   If key=#13 then
   begin
     Button1Click(Sender);
   end else
   begin
     NumEdit1 := GetWindowLong(Edit1.Handle, GWL_STYLE);
     SetWindowLong(Edit1.Handle, GWL_STYLE, NumEdit1 or ES_NUMBER);
   end;
end;

procedure TForm5.arrange;
var
  I, temp, temp2: integer;
  tempstr : string;
begin
  //
  candisplayR := false;
  combobox2.Clear;
  temp := -1;
  temp2 := -1;
  for I := 0 to typedataitem[combobox1.ItemIndex] - 1 do
  begin
    if Rini[combobox1.ItemIndex].Rterm[I].datanum > 0 then
      inc(temp2);
    if Rini[combobox1.ItemIndex].Rterm[I].isname = 1 then
    begin
      temp := temp2;
      break;
    end;
  end;
  //edit1.Text := RFile[1].Rdata[0].Rdataline[4].Rarray[0].dataarray[0].str;
  //edit1.text := inttostr(combobox1.itemindex);
  for I := 0 to RFIle.Rtype[combobox1.itemindex].datanum - 1 do
  begin
    if temp < 0 then
      combobox2.Items.Add(inttostr(I))
    else
    begin
      //tempstr := Pchar(RFile[combobox1.ItemIndex].Rdata[I].Rdataline[temp].Rarray[0].dataarray[0].str[0])
      //combobox2.Items.Add(inttostr(I)+ (Pstring(@(RFile[combobox1.ItemIndex].Rdata[I].Rdataline[temp].Rarray[0].dataarray[0].str[0])))^)
      combobox2.Items.Add(displaystr(inttostr(I) + readRDatastr(@RFile.Rtype[combobox1.ItemIndex].Rdata[I].Rdataline[temp].Rarray[0].dataarray[0])));
    end;
  end;
  combobox2.ItemIndex := 0;
  candisplayR := true;
end;

procedure readini;
var
  iniF: Tinifile;
  inifilename, tempstr: string;
  strlist: Tstringlist;
  i1,i2: integer;
  strnum: integer;
begin
  //
  
  try
    inifilename := ExtractFilePath(Paramstr(0)) + 'UPedit.ini';
    iniF := TIniFile.Create(inifilename);
    typenumber := iniF.ReadInteger('R_Modify','TypeNumber',0);
    //edit1.Text := inttostr(typenumber);
    if typenumber > 0 then
    begin
      setlength(Rini, typenumber);
      setlength(typedataitem, typenumber);
      setlength(typename, typenumber);
      strlist := Tstringlist.Create;
      for I1 := 0 to typenumber - 1 do
      begin
        typename[I1] := iniF.ReadString('R_Modify', 'typename' + inttostr(i1), '');
        typedataitem[I1] := iniF.ReadInteger('R_Modify', 'typedataitem' + inttostr(i1), 0);
        if typedataitem[i1] > 0 then
        begin
          setlength(Rini[i1].Rterm, typedataitem[i1]);
          for i2 := 0 to typedataitem[i1] - 1 do
          begin
            strlist.Clear;
            tempstr := iniF.ReadString('R_Modify','data(' + inttostr(i1) + ','+inttostr(i2) + ')','');
            if tempstr<>'' then
            begin
              strnum := ExtractStrings([' '], [], Pwidechar(tempstr), Strlist);
              if strnum = 8 then
              begin
                with Rini[i1].Rterm[i2] do
                begin
                  datanum := strtoint64(strlist.Strings[0]);
                  incnum := strtoint64(strlist.Strings[1]);
                  datalen := strtoint64(strlist.Strings[2]);
                  isstr := strtoint64(strlist.Strings[3]);
                  isname := strtoint64(strlist.Strings[4]);
                  quote := strtoint64(strlist.Strings[5]);
                  name := strlist.Strings[6];
                  note := strlist.Strings[7];
                end;
              end;
            end;
          end;

        end;
      end;
      strlist.free;


    end;
    iniF.free;
  except
    // showmessage('��ȡini�ļ�����');
    exit;
  end;
end;



procedure copyRdata(source, dest:PRdata);
var
  I1, i2, i3: integer;
begin
  dest.num := source.num;
  setlength(dest.Rdataline, dest.num);
  for i1 := 0 to source.num - 1 do
  begin
    dest.Rdataline[i1].len := source.Rdataline[i1].len;
    setlength(dest.Rdataline[i1].Rarray, source.Rdataline[i1].len);
    for i2 := 0 to source.Rdataline[i1].len - 1 do
    begin
      dest.Rdataline[i1].Rarray[i2].incnum := source.Rdataline[i1].Rarray[i2].incnum;
      setlength(dest.Rdataline[i1].Rarray[i2].dataarray, source.Rdataline[i1].Rarray[i2].incnum);
      for i3 := 0 to source.Rdataline[i1].Rarray[i2].incnum - 1 do
      begin
        dest.Rdataline[i1].Rarray[i2].dataarray[i3].datalen := source.Rdataline[i1].Rarray[i2].dataarray[i3].datalen;
        dest.Rdataline[i1].Rarray[i2].dataarray[i3].datatype := source.Rdataline[i1].Rarray[i2].dataarray[i3].datatype;
        dest.Rdataline[i1].Rarray[i2].dataarray[i3].datalen := max(dest.Rdataline[i1].Rarray[i2].dataarray[i3].datalen, 0);
        setlength(dest.Rdataline[i1].Rarray[i2].dataarray[i3].Data, dest.Rdataline[i1].Rarray[i2].dataarray[i3].datalen);
        //dest.Rdataline[i1].Rarray[i2].dataarray[i3].str := source.Rdataline[i1].Rarray[i2].dataarray[i3].str;
        if dest.Rdataline[i1].Rarray[i2].dataarray[i3].datalen > 0 then
          copymemory(@dest.Rdataline[i1].Rarray[i2].dataarray[i3].Data[0], @source.Rdataline[i1].Rarray[i2].dataarray[i3].data[0], dest.Rdataline[i1].Rarray[i2].dataarray[i3].dataLen);
      end;
    end;
  end;
end;

procedure calnamepos(PRF: PRFile);
var
  I1, i2, temp:integer;
begin
  for i1 := 0 to PRF.typenumber - 1 do
  begin
    PRF.Rtype[i1].namepos := -1;
    temp := -1;
    for i2 := 0 to typedataitem[i1] - 1 do
    begin
      if Rini[i1].Rterm[i2].datanum > 0 then
        inc(temp);
      if Rini[i1].Rterm[i2].isname = 1 then
      begin
        PRF.Rtype[i1].namepos := temp;
        break;
      end;
    end;
  end;
end;

procedure saveR(idx,grp:string; PRF:PRFile);
var
  I1, I2, I3, I4, I5: integer;
  offset: array of integer;
  F: integer;
begin
  //
  setlength(offset, PRF.typenumber);
  F := filecreate(grp);
  offset[0] := 0;
  for i1 := 0 to PRF.typenumber - 1 do
  begin
    if i1 > 0 then
      offset[i1] := offset[i1 - 1];
    for i2 := 0 to PRF.Rtype[i1].datanum - 1 do
    begin
      for i3 := 0 to PRF.Rtype[i1].Rdata[i2].num - 1 do
      begin
        for i4 := 0 to PRF.Rtype[i1].Rdata[i2].Rdataline[i3].len - 1 do
        begin
          for i5 := 0 to PRF.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].incnum - 1 do
          begin
            if PRF.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5].datalen > 0 then
              filewrite(F, PRF.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5].data[0], PRF.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5].datalen);
            inc(offset[i1],  PRF.Rtype[i1].Rdata[i2].Rdataline[i3].Rarray[i4].dataarray[i5].datalen);
          end;
        end;
      end;
    end;
  end;
  fileclose(F);
  F := Filecreate(idx);
  fileseek(F,0,0);

  filewrite(F, offset[0], PRF.typenumber * 4);

  fileclose(F);

end;



end.
