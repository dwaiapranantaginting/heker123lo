program atur_uang;
uses crt;
type
    kebutuhan=record
        nama: string;
        persen: real;
        hasil : real;
        end;
var
    i: integer;
    butuh: array [1..100] of kebutuhan;
    pemasukan: longint;
    banyak : integer;
    total : real;
    sisa  : real;

procedure inputan;
begin
    clrscr;

    write ('Masukkan pemasukan bulanan : ');
    readln (pemasukan);

    write ('Masukkan banyak kebutuhan : ');
    readln (banyak);

    for i := 1 to banyak do
    begin
        write ('Jenis kebutuhan ke-', i, ' : ');
        readln(butuh[i].nama);
    end;

    writeln;
    writeln ('Masukkan persentase (contoh: 50, 20, 15)');
    total := 0;

    for i := 1 to banyak do
    begin
        write (butuh[i].nama, ' : ');
        readln (butuh[i].persen);
        total := total + butuh[i].persen;
    end;
end;


procedure hitpersen;
begin
    inputan;

    for i := 1 to banyak do
    butuh[i].hasil := (butuh[i].persen / 100) * pemasukan;
end;

procedure cekpersen;
begin
    if total < 100 then
    begin
        sisa := ((100 - total) / 100) * pemasukan;
    end
    else if total > 100 then
    begin
        sisa := -((total - 100) / 100) * pemasukan;
    end
    else
    begin
        sisa := 0;
    end;
end;


procedure tabel;
begin
    clrscr;

    writeln('================= TABEL PENGELUARAN =================');
    writeln('No   Nama Kebutuhan        Biaya          Persentase');
    writeln('----------------------------------------------------');

    for i := 1 to banyak do
    begin
        writeln(
            i:2, '   ',
            butuh[i].nama:15, '     Rp ',
            butuh[i].hasil:10:0, '     ',
            butuh[i].persen:6:2, '%'
        );
    end;

    writeln('----------------------------------------------------');
    writeln('Total Persentase : ', total:0:2, '%');

    cekpersen;

    if sisa > 0 then
        writeln('SISA UANG        : Rp ', sisa:0:0)
    else if sisa < 0 then
        writeln('KEKURANGAN UANG  : Rp ', abs(sisa):0:0)
    else
        writeln('Uang PAS, tidak ada sisa');

    writeln('====================================================');
    readln;
end;



begin
    hitpersen;
    tabel;
end.
