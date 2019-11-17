unit uTest;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, DateUtils, FMX.ScrollBox, FMX.Memo;

type
  TFrmTeste = class(TForm)
    Panel2: TPanel;
    SUBMIT: TButton;
    OK: TButton;
    Edit1: TEdit;
    CHKTest: TCheckBox;
    Memo1: TMemo;
    SOMANDO: TLabel;
    Edit2: TEdit;
    Label1: TLabel;
    lblData: TLabel;
    Button1: TButton;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    editUser: TEdit;
    editSenha: TEdit;
    Button2: TButton;
    editPrimo: TEdit;
    Button3: TButton;
    lblPrimo: TLabel;
    grupo: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    edtMatriz: TEdit;
    btnMatriz: TButton;
    Button4: TButton;
    Panel3: TPanel;
    Label2: TLabel;
    edtNome: TEdit;
    edtNota1: TEdit;
    Label5: TLabel;
    edtNota2: TEdit;
    Label6: TLabel;
    Button5: TButton;
    Button6: TButton;
    mmoAluno: TMemo;
    btnTodos: TButton;
    Label7: TLabel;
    Button10: TButton;
    Label8: TLabel;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    ImageControl1: TImageControl;
    edtParImpar: TEdit;
    Button27: TButton;
    Button28: TButton;
    lblParImpar: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SUBMITClick(Sender: TObject);
    procedure OKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure lblDataEnter(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnMatrizClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
  private
    function isPrimo(num: Integer): boolean;
    procedure LimpaCampos;

    var
    vetor: array of Integer;
    matriz: array of array of integer;
    tamanho: integer;
  public
    { Public declarations }
  end;

var
  FrmTeste: TFrmTeste;
  bFechar:Boolean;

implementation

{$R *.fmx}
{$R *.Surface.fmx MSWINDOWS}
{$R *.Macintosh.fmx MACOS}
{$R *.Windows.fmx MSWINDOWS}

type rgAluno = record
  nome: string[64];
  nota1: Double;
  nota2: Double;
end;

var aluno: array of rgAluno;
    n: integer = 0;
    x: rgAluno;




procedure TFrmTeste.btnMatrizClick(Sender: TObject);
var i,j:integer;
    s:String;
begin
  if RadioButton1.IsChecked or RadioButton2.IsChecked then
  begin
    if edtMatriz.Text <> '' then
      begin
        btnMatriz.Visible := false;
        edtMatriz.Visible := false;
        Button4.Visible := true;
      end;
  end;
  tamanho := edtMatriz.Text.ToInteger();
  memo1.Lines.Clear;
  randomize;
  if not RadioButton1.IsChecked and not RadioButton2.IsChecked then
    ShowMessage('Selecione um tipo de Array');
  if RadioButton1.IsChecked then
     begin
      setLength(vetor, tamanho);
      for i := Low(vetor) to High(vetor) do
        begin
          vetor[i] := random(10);
          memo1.Lines.Add(Format('%2dª linha = %2d',[i, vetor[i]]));
        end;
     end;
  if RadioButton2.IsChecked then
    begin
      setLength(matriz, tamanho);
      for i := Low(matriz) to High(matriz) do
        begin
          s:= '';
          setLength(matriz[i], tamanho);
          for j := Low(matriz[i]) to High(matriz[i]) do
           begin
              matriz[i,j]:= random(10);
              s := s + Format('%2d ',[matriz[i, j]]);
            end;
           memo1.Lines.Add(s);
        end;
    end;
end;

procedure TFrmTeste.btnTodosClick(Sender: TObject);
var nreg,i: Integer;
    media: Real;
begin
  mmoAluno.Text := '';
  nreg := 0;
  mmoAluno.Lines.Add(' =-=-=-=-= LISTA DOS ALUNOS -=-=-=-=- ');
  for i := 0 to n-1 do
  begin
    x:= aluno[i];
    inc(nreg);

    media := (x.nota1+x.nota2)/2;
    mmoAluno.Lines.Add('Registro Nro.: ' + intToStr(nReg));
    mmoAluno.Lines.Add('Nome do Aluno: ' + x.nome);
    mmoAluno.Lines.Add('1ª Nota......: ' + Format('%.2f',[x.nota1]));
    mmoAluno.Lines.Add('2ª Nota......: ' + Format('%.2f',[x.nota2]));
    mmoAluno.Lines.Add('Média .......: ' + Format('%.2f',[media]));

    if(media >= 7) then
      mmoAluno.Lines.Add('Situação.....: APROVADO')
    else if (media < 5) then
      mmoAluno.Lines.Add('Situação.....: REPROVADO')
    else
      mmoAluno.Lines.Add('Situação.....: RECUPERAÇÃO');

    mmoAluno.Lines.Add('-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=')
  end;
end;


procedure TFrmTeste.Button10Click(Sender: TObject);
begin
  Button10.Visible := false;
  showMessage('Click! Click! Click!');
end;

procedure TFrmTeste.Button11Click(Sender: TObject);
begin
  button11.Visible := false;
  showMessage('Já to sem criatividade');
end;

procedure TFrmTeste.Button12Click(Sender: TObject);
begin
  button12.Visible := false;
  showMessage(':)');
end;

procedure TFrmTeste.Button13Click(Sender: TObject);
begin
  button13.Visible := false;
  showMessage('Pode ter certeza que o desenvolvedor achou fazer isso bem mais chato do que você');
end;

procedure TFrmTeste.Button14Click(Sender: TObject);
begin
  button14.Visible := false;
  showMessage('Nunca deista dos seus sonhos! Mas isso é um pesadelo, desiste!');
end;

procedure TFrmTeste.Button15Click(Sender: TObject);
begin
  button15.Visible := false;
  showMessage('Você sabe que não vai valer a pena né?');
end;

procedure TFrmTeste.Button16Click(Sender: TObject);
begin
  button16.Visible := false;
  showMessage('Uma pessoa sabia sabe o momento de desistir, você é burro?');
end;

procedure TFrmTeste.Button17Click(Sender: TObject);
begin
  button17.Visible := false;
  showMessage('Ai Ai');
end;

procedure TFrmTeste.Button18Click(Sender: TObject);
begin
  button18.Visible := false;
  showMessage('Você tá chegando perto!');
end;

procedure TFrmTeste.Button19Click(Sender: TObject);
begin
  button19.Visible := false;
  showMessage('É como diz aquele ditado, não se faz omelete sem quebrar os ovos');
end;

procedure TFrmTeste.Button1Click(Sender: TObject);
begin
  ShowMessage('- Vai me dar R$10'#10'- Aceita entregar todos seus dados'#13'- Não vai me processar a qualquer custo');
end;

procedure TFrmTeste.Button20Click(Sender: TObject);
begin
  button20.Visible := false;
  showMessage('Rosa é vermelha'#10'Violeta é Azul'#10'Para de clikar se não vou comer tofu');
end;

procedure TFrmTeste.Button21Click(Sender: TObject);
begin
  button21.Visible := false;
  showMessage('Para, se não eu vou chamar a policia! call(190);');
end;

procedure TFrmTeste.Button22Click(Sender: TObject);
begin
  button22.Visible := false;
  showMessage('Mentira vou sim');
end;

procedure TFrmTeste.Button23Click(Sender: TObject);
begin
  button23.Visible := false;
  showMessage('Não vou nem falar mais nada, você não vai me ouvir mesmo');
end;

procedure TFrmTeste.Button24Click(Sender: TObject);
begin
  button24.Visible := false;
  showMessage('Ai! Ai! Um botão tambem sente dor, clica mais fraco!');
end;

procedure TFrmTeste.Button25Click(Sender: TObject);
begin
  button25.Visible := false;
  showMessage('SEU MONSTRO');
end;

procedure TFrmTeste.Button26Click(Sender: TObject);
begin
  button26.Visible := false;
  showMessage('Cada botão que você clica uma criança carente morre');
end;

procedure TFrmTeste.Button27Click(Sender: TObject);
begin
  if edtParImpar.Text.ToInteger mod 2 = 0 then
    lblParImpar.Text := 'SIM'
  else
    lblParImpar.Text := 'NÃO'

end;

procedure TFrmTeste.Button28Click(Sender: TObject);
begin
  if edtParImpar.Text.ToInteger mod 2 = 0 then
    lblParImpar.Text := 'NÃO'
  else
    lblParImpar.Text := 'SIM'
end;

procedure TFrmTeste.Button2Click(Sender: TObject);
var user, senha:String;
    Vuser, Vsenha:Integer;
begin
  Vuser  := 0;
  user   := editUser.Text;
  senha  := editSenha.Text;
{TODO: implementar esse switch
  case user.ToInteger of
      'gumartins2001@gmail.com': Vuser := 1;
          'teste@gmail.com': Vuser := 2;
              'uniware@gmail.com': Vuser := 3;
                end;

                  case senha of
                      'qwer123': Vsenha := 1;
                          'teste123': Vsenha := 2;
                              'unilab': Vsenha := 3;
                                end;}
  //Usuario
  if user = 'gumartins2001@gmail.com' then
    Vuser := 1
  else if user = 'teste@gmail.com' then
    Vuser := 2
  else if user = 'uniware@gmail.com' then
    Vuser := 3;

  //Senha
  if senha = 'qwer123' then
    Vsenha := 1
  else if senha = 'teste123' then
    Vsenha := 2
  else if senha = 'unilab' then
    Vsenha := 3;

  //Verificação
  if (Vuser - Vsenha) = 0 then
    ShowMessage('Logado com sucesso!')
  else if Vuser = 0 then
    ShowMessage('Usuario não cadastrado!')
  else
    ShowMessage('Senha incorreta!');



end;

procedure TFrmTeste.Button3Click(Sender: TObject);
begin

  if isPrimo(editPrimo.Text.ToInteger()) then
    lblPrimo.Text := 'Resposta = SIM'
  else
    lblPrimo.Text := 'Resposta = NÃO';

end;

procedure TFrmTeste.Button4Click(Sender: TObject);
begin
  if RadioButton1.IsChecked or RadioButton2.IsChecked then
  begin
    if edtMatriz.Text <> '' then
      begin
        btnMatriz.Visible := true;
        edtMatriz.Visible := true;
        Button4.Visible := false;
      end;
  end;
end;

procedure TFrmTeste.Button5Click(Sender: TObject);
var nreg,i: Integer;
    media: Real;
begin
  mmoAluno.Text := '';
  nreg := 0;
  mmoAluno.Lines.Add(' -=-=-=-=-= PROCURAR ALUNO -=-=-=-=-= ');
  for i := 0 to n-1 do
  begin
    x:= aluno[i];
    inc(nreg);
    if x.nome = edtNome.Text.ToUpper then
    begin
      media := (x.nota1+x.nota2)/2;
      mmoAluno.Lines.Add('Registro Nro.: ' + intToStr(nReg));
      mmoAluno.Lines.Add('Nome do Aluno: ' + x.nome);
      mmoAluno.Lines.Add('1ª Nota......: ' + Format('%.2f',[x.nota1]));
      mmoAluno.Lines.Add('2ª Nota......: ' + Format('%.2f',[x.nota2]));
      mmoAluno.Lines.Add('Média .......: ' + Format('%.2f',[media]));

      if(media >= 7) then
        mmoAluno.Lines.Add('Situação.....: APROVADO')
      else if (media < 5) then
        mmoAluno.Lines.Add('Situação.....: REPROVADO')
      else
        mmoAluno.Lines.Add('Situação.....: RECUPERAÇÃO');

      mmoAluno.Lines.Add('-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=')
    end;
  end;
end;

procedure TFrmTeste.Button6Click(Sender: TObject);
begin
  if (edtNome.Text <> '') and (edtNota1.Text <> '') and (edtNota2.Text <> '') then
  begin
    x.nome := edtNome.Text.ToUpper;
    x.nota1 := StrToFloat(edtNota1.Text);
    x.nota2 := StrToFloat(edtNota2.Text);
    inc(n);
    SetLength(aluno,n);
    aluno[n-1] := x;
    mmoAluno.Lines.Add(x.nome + ' gravado com sucesso!');
    LimpaCampos;

  end
  else
  begin
    showMessage('Campo(s) não preenchido(s)');
  end;


end;

procedure TFrmTeste.Button7Click(Sender: TObject);
begin
  Button7.Visible := false;
  showMessage('Parabéns pelo premio!');
end;

procedure TFrmTeste.Button8Click(Sender: TObject);
begin
  Button8.Visible := false;
  showMessage('Pare por favor!');
end;

procedure TFrmTeste.Button9Click(Sender: TObject);
begin
  button9.Visible := false;
  showMessage('É melhor você desistir agora!');
end;

procedure TFrmTeste.FormActivate(Sender: TObject);
var data : TDateTime;
begin
  // Com hora
  data := Now;
  LblData.Text := DateTimeToStr(data);

  //Sem hora
  data := Now;
  LblData.Text := DateToStr(data);
end;

procedure TFrmTeste.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ShowMessage('Obrigado por usar o App! :)');
end;

procedure TFrmTeste.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  canClose := bFechar;
end;

procedure TFrmTeste.FormCreate(Sender: TObject);

begin
  //edit1.Text := DateToStr(Today);
  {Apaguei para não mostrar a data}
  Button4.Visible := false;
  bfechar := false;




  // TODO: Implementar grafico
end;


procedure TFrmTeste.lblDataEnter(Sender: TObject);
var data : TDateTime;
begin
//TODO: Implementar esse while que mostra as horas em tempo real
{
  while True do
    begin
        LblData.Text := DateTimeToStr(data);
          end;
          }
end;

procedure TFrmTeste.OKClick(Sender: TObject);
var x : Integer;
begin
  if (OK.Text = '+') then
    begin
      x := edit1.Text.ToInteger() + edit2.Text.ToInteger();
      Label1.Text :=  'Resposta = ' + x.ToString;
      OK.Text := '-';
    end
  else if(OK.Text = '-') then
    begin
      x := edit1.Text.ToInteger() - edit2.Text.ToInteger();
      Label1.Text :=  'Resposta = ' + x.ToString;
      OK.Text := '*';
    end
  else if OK.Text = '*' then
    begin
      x := edit1.Text.ToInteger() * edit2.Text.ToInteger();
      Label1.Text :=  'Resposta = ' + x.ToString;
      OK.Text := 'mod';
    end
  else if OK.Text = 'mod' then
    begin
      x := edit1.Text.ToInteger() mod edit2.Text.ToInteger();
      Label1.Text :=  'Resposta = ' + x.ToString;
      OK.Text := 'div';
    end
  else
    begin
      x := edit1.Text.ToInteger() div edit2.Text.ToInteger();
      Label1.Text :=  'Resposta = ' + x.ToString;
      OK.Text := '+';
    end


end;


procedure TFrmTeste.SUBMITClick(Sender: TObject);
var I:Integer;
begin
  if CHKTest.IsChecked then
  begin
    bfechar := true;
    for I := 3 downto 1 do
    begin
      ShowMessage('Fechando em ' + (I).toString());
      sleep(1000);
    end;
    close();
  end
  else
    ShowMessage('Você deve aceitar o termo para submeter');
end;
  function TFrmTeste.isPrimo(num:Integer):boolean;
  var I, divisoes:integer;
  begin
    for I := 1 to num do
      if num mod I = 0 then
        inc(divisoes);
    if divisoes = 2 then
      Result := true
    else
      Result := false;

  end;

  procedure TFrmTeste.LimpaCampos;
  begin
    edtNome.Text := '';
    edtNome.SetFocus;
    edtNota1.Text := '';
    edtNota2.Text := '';
  end;
end.

