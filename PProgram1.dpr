program PProgram1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UCNumeroNatural in 'UCNumeroNatural.pas',
  UCVector in 'UCVector.pas';


var A:CVector;
    n,I,primoActual:Integer;

begin
  A:=CVector.Crear;

  writeln('Digite la dimension del vector');
  readln(n);

  A.Dimensionar(n);

  //cargar numeros primos
  //A.CargarNNumerosPrimos();
  primoActual:=0;

  writeln(A.ComoString());


  //writeln(v.ElementoMayor());


  readln;
end.

