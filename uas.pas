program atur_uang;
uses crt;
type
    kebutuhan=record
        nama: string;
        persen: real;
        saldo: longint;
        end;
var
    i: integer;
    butuh: array [1..5] of kebutuhan;
    pemasukan,sisa: longint;
    pengeluaran: array [1..5] of longint;
begin
    clrscr;
    write ('masukkan pemasukan bulanan: '); readln (pemasukan);
    writeln ('masukkan jenis kebutuhan (maksimal 5 jenis): ');
    for i:=1 to 5 do begin
            write ('jenis kebutuhan: '); readln (butuh[i].nama); end;
    writeln;

    writeln ('pilih persentase kebutuhan (dalam desimal): [50%] [20%] [15%] [10%] [5%] ');
    for i:= 1 to 5 do begin
        with butuh[i] do begin
            write (nama,': '); readln (persen);
            // disini buat pilihannya cuma bisa dipilih sekali, kalo bisa buat di function/procedure
            saldo:= round (persen*pemasukan); 
            writeln (nama,': ',saldo);end;
    end;
    writeln;

    repeat
end.
