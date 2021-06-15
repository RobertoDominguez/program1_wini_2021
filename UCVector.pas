unit UCVector;
Interface
uses SysUtils,
UCNumeroNatural;

Const
 MaxE = 100;
Type
 ConjuntoElementos = Array[1..MaxE] of Integer;
 CVector = Class
 Private
 N : Word;
 Elementos : ConjuntoElementos;// array[1..100] of integer
 Public
 Constructor Crear;
 Procedure Dimensionar( Dim : Word );
 Procedure Poner( Posi: Word; Elem : Integer);
 Function Elemento( Posi : Word ): Word ;
 Function Dimension : Word;
 Function ComoString : String;
 Function ElementoMayor : Integer;
 Procedure CargarNNumerosPrimos(_n:Integer);
End;

Implementation
{ CVector }

 Constructor Cvector.crear;
Begin
  N:=0;
End;

Procedure cvector.Dimensionar( Dim : Word);
Begin
  if Dim<=MaxE then
  begin
    n:=dim;
  end;

End;

Procedure Cvector.poner( posi:word; elem: integer);
Begin
  If (posi>0) and (posi<= N) then
  elementos[ posi]:= elem
  else
  writeln('indice fuera de rango ');
End;

Function cvector.Dimension:Word;
Begin
  Dimension:=n;
End;

Function cvector.elemento( posi:word):word;
Begin
  If (posi>0) and (posi<= N) then
   elemento:=elementos[ posi]
  else
   writeln('índice fuera de rango');
End;

Function Cvector.comostring:String;
Var
 s:string;
 I : integer;
Begin
   s:='';
   for I := 1 to n do
    s:= s +IntToStr(elementos[i])+ ' ';
   comostring:=s;
End;

function cvector.ElementoMayor:Integer;
var mayorActual,I:Integer;
begin
  mayorActual:=Integer.MinValue;
  for I := 1 to n do
  begin
    if elementos[i]>mayorActual then
      mayorActual:=elementos[i];
  end;
  ElementoMayor:=mayorActual;
end;


Procedure cvector.CargarNNumerosPrimos(_n:Integer);
var
  I,primoActual: Integer;
  nn:CNumeroNatural;
begin
  Dimensionar(_n);
  primoActual:=0;
  nn:=CNumeroNatural.Crear;
  nn.AsignarValor(primoActual);
  for I := 1 to n do
  begin
    while (not nn.EsPrimo) do
    begin
      primoActual:=primoActual+1;
      nn.AsignarValor(primoActual);
    end;
    elementos[i]:=primoActual;
    primoActual:=primoActual+1;
    nn.AsignarValor(primoActual);
  end;

end;


end.
