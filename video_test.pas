program video_test;

//{$codepage utf8}

uses video, sysutils;

var
 c: TVideoCell;
 i: integer;
 s: string;
begin

	writeln(UTF8Enabled());
	writeln(internal_codepage,' ',external_codepage);
    internal_codepage:=utf8;
    external_codepage:=utf8;

	InitVideo;
	for i := 0 to 3999 do
	begin
		Int64Rec(c).Hi := 08;
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

	VideoBuf^[98] := c;

    // unicode is lost here with {$codepage utf8} enabled
    s := 'гш';
    Int64Rec(c).Bytes[0] := Ord(s[1]);
	Int64Rec(c).Bytes[1] := Ord(s[2]);
    VideoBuf^[99] := c;
    Int64Rec(c).Bytes[0] := Ord(s[3]);
    Int64Rec(c).Bytes[1] := Ord(s[4]);
    VideoBuf^[100] := c;

	UpdateScreen(true);
    readln();

    writeln(s);
    writeln('*',s[1],'*',Ord(s[1]));
    writeln('*',s[2],'*',Ord(s[2]));
    writeln('*',s[3],'*',Ord(s[3]));
    writeln('*',s[4],'*',Ord(s[4]));
    readln();

	//writeln(chr(207), chr(191));
    //readln();

end.
