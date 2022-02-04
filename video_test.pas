program video_test;

uses video, sysutils;

var
 c: TVideoCell;
 i: integer;
begin

	writeln(UTF8Enabled());
	writeln(internal_codepage,' ',external_codepage);
    internal_codepage:=utf8;
    external_codepage:=utf8;

	InitVideo;
	for i := 0 to 3999 do
	begin
		Int64Rec(c).Hi := 00;
		Int64Rec(c).Lo := 32;
		VideoBuf^[i] := c;
	end;
	UpdateScreen(true);

	Int64Rec(c).Hi := 18;
	//Int64Rec(c).Lo := 43; // '+'

	Int64Rec(c).Bytes[0] := 208; // d0
	Int64Rec(c).Bytes[1] := 191; // bf

	VideoBuf^[0] := c;

	Int64Rec(c).Hi := 80;

	Int64Rec(c).Bytes[0] := 209; // d1
	Int64Rec(c).Bytes[1] := 128; // 80

	VideoBuf^[1] := c;

	UpdateScreen(true);
    readln();

	//writeln(chr(207), chr(191));
    //readln();

end.
