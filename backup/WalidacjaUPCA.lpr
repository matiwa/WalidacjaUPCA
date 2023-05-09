program WalidacjaUPCA;
uses
SysUtils;

var
UPC_A : array [0..13] of Integer;
poprawnosc : boolean = false;
ciagUPCA : string;

Systems : array [0 .. 9] of String = (
'zwykly kod UPC', 'zarezerwowany', 'waga prduktow wazonych w sklepie',
'lekarstwa', 'artykul nie będący zywnoscia', 'kupony', 'zarezerwowany',
'zwykly kod UPC', 'zarezerwowany', 'zarezerwowany' );

function sprawdzenieSumyKontrolnej(UPC_A: array of Integer): boolean;
var
suma: Integer;
begin

suma := 3 * UPC_A[0] +
1 * UPC_A[1] +
3 * UPC_A[2] +
1 * UPC_A[3] +
3 * UPC_A[4] +
1 * UPC_A[5] +
3 * UPC_A[6] +
1 * UPC_A[7] +
3 * UPC_A[8] +
1 * UPC_A[9] +
3 * UPC_A[10];

suma := suma mod 10;
suma := 10 - suma;
suma := suma mod 10;

if suma = UPC_A[11] then
result := true
else
result := false;

end;

procedure walidacjaUPCA(numerUPCA: String);
var
i : integer;
begin

if (length(numerUPCA) <> 12) then
poprawnosc := false
else
begin
for i := 0 to 11 do
UPC_A[i] := strToInt(numerUPCA[i+1]);

if sprawdzenieSumyKontrolnej(UPC_A) then
poprawnosc := true
else
poprawnosc := false;
end;
end;


begin
writeln('Nie uzywaj spacji i myslnikow!');
write('Wprowadz UPC-A: ');
readln(ciagUPCA);

walidacjaUPCA(ciagUPCA);

writeln;

if poprawnosc then
begin
writeln('UPC-A: prawidlowy');
writeln('Numer systemu: ' + Systems[UPC_A[0]]);
end
else
begin
writeln('UPC-A: nieprawidlowy');
end;
readln;
end.

