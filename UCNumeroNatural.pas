Unit UCNumeroNatural;

interface

Uses
  sysUtils,math;

Type
    CNumeroNatural = class
        Private
            Valor:Cardinal;
        Public
            Constructor Crear;
            Procedure AsignarValor(NuevoValor:Cardinal);
            Procedure InsertarDigito(Posicion:Byte; Digito:byte);
            Procedure EliminarDigito(Posicion:byte);
            Procedure Invertir;
            Function ObtenerValor():Cardinal;
            Function NumeroDIgitos:Byte;
            Function Digito(Posicion:byte):byte;
            Function EsPrimo():Boolean;
            Function EsPAr():Boolean;
            Function EsImp():Boolean;
            Function SumaDigitos():byte;
            Function CantidadDigitosPar():byte;
            Function CantidadDigitosImpar():byte;
            Function DigitoMenor():byte;
            Procedure EliminarDigitoMenor;
            Procedure OrdAdentroAFuera;
            Procedure Eliminar(inicio,cantidad:byte);
            Procedure EliminarValorDigito(d:byte);

        end;

implementation

{ CNumeroNatural }

constructor CNumeroNatural.Crear;
begin
  valor := 0;
end;

procedure CNumeroNatural.AsignarValor(NuevoValor: Cardinal);
begin
    valor := NuevoValor;
end;

procedure CNumeroNatural.InsertarDigito(Posicion, Digito: byte);
var
    c:byte;
    pot,aux:cardinal;
begin
    c := NumeroDigitos;
    pot := 10;
    while (posicion <= c) do
    begin
        if (posicion = c) then
        begin
            aux := valor mod pot;
            valor := valor div pot;
            valor := (valor * 10) + Digito;
            valor := (valor * pot) + aux;
        end;
        pot := pot * 10;
        Dec(c);
    end;
end;

procedure CNumeroNatural.EliminarDigito(Posicion:byte);
  var
      i,aux:cardinal;
      c:byte;
begin
    c := NumeroDigitos;
    i := 1;
    Repeat
        if (c = posicion) then
        begin
            aux := valor mod i;
            valor := valor div i;
            valor := valor div 10;
            valor := (valor * i) + aux;
        end;
        Dec(c);
        i := i * 10;
    Until (c < posicion);
end;

procedure CNumeroNatural.EliminarDigitoMenor;
var
    i,pos,men:byte;
begin
    men := 9;
    pos := 1;
    for I := 1 to NumeroDigitos do
    begin
        if (Digito(i) < men) then
        begin
            pos := i;
            men := Digito(i);
        end;
    end;
    EliminarDigito(pos);
end;

procedure CNumeroNatural.EliminarValorDigito(d: byte);
var i:byte;
begin
    i:=1;
    while (i<=NumeroDigitos) do
    begin
        if (Digito(i) = d) then
        begin
          EliminarDigito(i);
          dec(i);
        end;
        Inc(i);
    end;


end;

function CNumeroNatural.ObtenerValor: Cardinal;
begin
  result := valor;
end;

procedure CNumeroNatural.OrdAdentroAFuera;
var
    i:byte;
    pot,n:cardinal;
begin
    i := 1;
    pot := 1;
    n := 0;
    while (valor > 0) do
    begin
        if (valor > 0) then
        begin
            n := n * 10 + DigitoMenor();
            EliminarDigitoMenor;
            pot := pot * 10;
        end;
        if (valor > 0) then
        begin
            n := (DigitoMenor * pot) + n;
            EliminarDigitoMenor;
            pot := pot * 10;
        end;
    end;
    AsignarValor(n);
end;

function CNumeroNatural.Digito(Posicion: byte): byte;
var
  c,dig:byte;
  aux:cardinal;
begin
    c := NumeroDigitos;
    Aux := valor;
    while (c >= Posicion) do
    begin
      dig := aux mod 10;
      Dec(c);
      Aux := Aux div 10;
    end;
  result := dig;
end;

function CNumeroNatural.DigitoMenor: byte;
var
    i,men:byte;
begin
    men := 9;
    for i := 1 to NumeroDigitos do
        if (Digito(i) < men) then
          men := Digito(i);
    result := men;
end;

function CNumeroNatural.NumeroDIgitos: Byte;
begin
  if (valor<>0) then
    result := trunc(Log10(valor)) + 1
  else
    result := 1;
end;

procedure CNumeroNatural.Invertir;
var
    aux:cardinal;
begin
    aux := valor;
    valor := 0;
    repeat
      valor := (valor * 10) + (aux mod 10);
      aux := aux div 10;
    until (aux < 1);
end;

function CNumeroNatural.EsPAr: Boolean;
begin
  result := (Valor mod 2 = 0);
end;

function CNumeroNatural.EsImp: Boolean;
begin
  result := (Valor mod 2 = 0);
end;

function CNumeroNatural.EsPrimo: Boolean;
var
    i:cardinal;
    c:byte;
begin
    i := 2;
    c := 0;
    Repeat
        if (valor mod i = 0) then
          Inc(c);
        Inc(i);
    Until ((i >= valor) xor (c > 1));
    result := (c=0);
end;

function CNumeroNatural.SumaDigitos: byte;
var
    sum,i:byte;
begin
    sum := 0;
    for i := 1 to NumeroDigitos() do
        sum := sum + Digito(i);
    result := sum;
end;

function CNumeroNatural.CantidadDigitosPar: byte;
var
    aux:cardinal;
    c:byte;
begin
    aux := valor;
    c := 0;
    repeat
        if (aux mod 2=0) then  Inc(c);
         aux := aux div 10;
    until (aux < 1);
    result := c;
end;

function CNumeroNatural.CantidadDigitosImpar: byte;
var
    aux:cardinal;
    c:byte;
begin
    aux := valor;
    c := 0;
    repeat
        if (aux mod 2=1) then  Inc(c);
         aux := aux div 10;
    until (aux < 1);
    result := c;
end;

Procedure CNumeroNatural.Eliminar(inicio,cantidad:byte);
var
  aux:cardinal;
  ND,i,c:byte;
  b:boolean;
begin
    aux := valor;
    ND := NumeroDigitos();
    c := 0;
    b:= true;
    i := 1;
    if (((inicio > 0) and (inicio <= ND)) and (ND >=(inicio+Cantidad)-1)) then
    begin
      while (b) do
      begin
        if (inicio <= i) then
        begin
          EliminarDigito(i);
          dec(i);
          inc(c);
          if (c >= cantidad) then
           b := false;
        end;
        inc(i);
       end;
    end
    else
      writeln('Error en los parametros');
end;


end.
