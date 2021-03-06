program Project6;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  d1 = 1.0;
  d2 = 2.0;
  d3 = 1.0;
  alfa = 2.0;
  eps = 0.05;

Function Fi(x: real): real;
begin
Result := 0;
if (x >= 0) and (x < 2 * d1) then
Result := Abs(x - d1) - d1
else
begin
if (x >= 2 * d1) and (x < 2 * d1 + 2 * d2) then
Result := Abs(x - 2 * d1 - d2) - d2;
if (x >= 2 * d1 + 2 * d2) and (x <= 2 * d1 + 2 * d2 + 2 * d3) then
Result := Abs(x - 2 * d1 - 2 * d2 - d3) - d3;
end;
end;
var
  u, ksi: array [0..100] of real;
  i, p, k, j: integer;
  x0, x1, Fx0, Fx1, W, x_, v, x, Fx,
  a, b: real;
label M;
label N;
begin
  Write('Interval a, b ');
  a:=-2;
  b:=8;
  x0 := a;
  x1 := b;
  WriteLn('a=', x0:5:5, ' b=', x1:5:5);
  Fx0 := Fi(x0);
  Fx1 := Fi(x1);
 if Fx0 <= Fx1 then
    begin
      W := Fx0;
      x_ := x0;
    end
    else
    begin
      W := Fx1;
      x_ := x1;
    end;
  u[0] := 0.5 * (alfa * (x0 - x1) + (Fx0 + Fx1));
  ksi[0] := 0.5 * (x0 + x1) + (Fx0 - Fx1) / (2 * alfa);
  v := u[0];
  k := 1;
  while W - v >= eps do
    begin //3
    p := 0;
    for i := 0 to k - 1 do
    if u[i] = v then
   begin
   p := i;
   Break;
   end;
   x := ksi[p];
   Fx := Fi(x);
   if Fx > 2 * W - v then
   begin //4
   for i := p to k - 1 do
   begin
   u[i] := u[i + 1];
   ksi[i] := ksi[i + 1];
   end;
   k := k - 1;
   Goto M;
   end; //4
   if Fx < W then
   begin //5
   W := Fx;
   x_ := x;
   WriteLn('Wi=', W:5:5, ' xi=', x_:5:5);
   repeat
   j := -1;
   for i := 0 to k - 1 do
   if u[i] >= W then
   begin
   j := i;
   Break;
   end;
   if j <> -1 then
   begin
   for i := j to k - 1 do
   begin
   u[i] := u[i + 1];
   ksi[i] := ksi[i + 1];
   end;
   k := k - 1;
   end;
   until j = -1;
   end; //5
   u[k + 1] := 0.5 * (Fx + v);
   ksi[k + 1] := ksi[p] + (Fx - v) / (2 * alfa);
   ksi[p] := 2 * ksi[p] - ksi[k + 1];
   u[p] := u[k + 1];
   k := k + 1;
   M:
   v := u[0];
   for i := 0 to k do
   if u[i] < v then
   v := u[i];
    end;
  WriteLn;
  WriteLn('Min W=', W:5:5, ' x=', x_:5:5);
  ReadLn;
end.
