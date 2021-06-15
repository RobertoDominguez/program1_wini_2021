program PProgram1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UCNumeroNatural in 'UCNumeroNatural.pas',
  UCVector in 'UCVector.pas';

var v:CVector;
    entrada,I:Integer;
begin
  v:=CVector.Crear;

  writeln('Digite la dimension del vector');
  readln(entrada);

  v.Dimensionar(entrada);

  for I := 1 to v.Dimension() do
  begin
     writeln('Digite el elemento',I,' del vector');
    readln(entrada);

    v.Poner(I,entrada);
  end;

  //v.CargarNNumerosPrimos(entrada);

  writeln(v.ComoString());
  writeln(v.ElementoMayor());


  readln;
end.

