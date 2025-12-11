program atur_uang;
uses crt;
type
    kebutuhan=record
        nama: string;
        p_kebutuhan: longint;
        saldo: longint;
        persen : real;
        end;
const
    max = 100;
var
    i: integer;
    butuh: array [1..max] of kebutuhan;
    b_kebutuhan : integer;
    pemasukan,sisa: longint;
    total : integer;

procedure inputanUser;
begin
clrscr;
    write('Masukkan Pemasukkan Bulanan kamu : '); readln(pemasukan);
    writeln;
    write('Masukkan Banyak jenis kebutuhan kamu (misalnya makan, skincare, tabungan <== terhitung 3) : '); readln(b_kebutuhan);
    for i := 1 to b_kebutuhan do begin
        write('jenis kebutuhan ke-', i, ' :'); readln(butuh[i].nama);
        end;
        writeln;

        writeln('pilih pengeluaran setiap jenis kebutuhan (misalnya skincare : 100000)');
        total := 0;
    for i:= 1 to b_kebutuhan do begin
        with butuh[i] do begin
            write (nama,': '); readln(p_kebutuhan);

            total := total + p_kebutuhan;
        end;
    end;
    sisa := pemasukan - total;
end;

procedure Persentase;
begin
    for i := 1 to b_kebutuhan do
    begin
    with butuh[i] do
    begin
    persen := (p_kebutuhan / total) * 100;
        end;
    end;
end; 


procedure tabell;
begin
    writeln('================= TABEL PENGELUARAN =================');
    writeln('No   Nama Kebutuhan        Biaya          Persentase');
    writeln('------------------------------------------------------');

    for i := 1 to b_kebutuhan do
    begin
        with butuh[i] do
        begin
        writeln(i, '      ', nama:15, '          ', p_kebutuhan:10, '          ', persen:6:2, '%') ;
        end;
    end;

    writeln('------------------------------------------------------');
    writeln('Total Pengeluaran : ', total);
    writeln('Sisa Uang         : ', sisa);
    writeln('======================================================');
end;

begin
inputanUser;
Persentase;
tabell;
end.
