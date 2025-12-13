program atur_uang;
uses crt;
type
    kebutuhan=record
        nama: string;
        p_kebutuhan: longint;
        persen : extended;
        porsi: integer;
        pemasukan_perkebutuhan: longint;
        sisa_perkebutuhan: longint;
        end;
const
    max = 100;
    max_persen = 100;
var
    i: integer;
    butuh: array [1..max] of kebutuhan;
    b_kebutuhan, total_porsi : integer;
    pemasukan,sisa, total: longint;
    ulangan : char;
    persen_total : real;

procedure inputanUser;
begin
clrscr;
    write('Masukkan Pemasukkan Bulanan kamu : '); readln(pemasukan);
    writeln;
    repeat
    write('Masukkan Banyak jenis kebutuhan kamu (misalnya makan, skincare, tabungan <== terhitung 3) : '); readln(b_kebutuhan);
    if b_kebutuhan > max then 
    writeln('Input salah!!!');
    writeln;
    until b_kebutuhan < max;
    if b_kebutuhan >= 10 then
    writeln('kebutuhan banyak banget twin :( dunia kejam, tetap semangat');

    for i := 1 to b_kebutuhan do begin
        write('jenis kebutuhan ke-', i, ' :'); readln(butuh[i].nama);
        end;
        writeln;
end;

procedure input_keluaran;
begin
        writeln('pilih pengeluaran setiap jenis kebutuhan (misalnya skincare : 100000)');
        total := 0;
    for i:= 1 to b_kebutuhan do begin
        with butuh[i] do begin
            write ('pengeluaran ', nama ,' : '); readln(p_kebutuhan);

            total := total + p_kebutuhan;
        end;
    end;
    sisa := pemasukan - total;
    writeln;
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

procedure hitungpersentotal;
begin
    persen_total := (total / pemasukan) * 100;
end;

procedure porsikebutuhan;
begin
repeat
    total_porsi:=0;
    writeln ('Masukkan porsi masing-masing kebutuhan(contoh: 50% dimasukkan dalam bentuk 50):');
    for i:= 1 to b_kebutuhan do
    with butuh[i] do
    begin
        write (nama,': '); readln (porsi);
        total_porsi:= total_porsi+porsi;
        if total_porsi > max_persen then
        writeln ('Porsi kebutuhan melebihi kapasitas!! Silakan input ulang');
        pemasukan_perkebutuhan:= round(pemasukan*(porsi/100));
    end;
until total_porsi <= max_persen; writeln;
writeln ('===== PORSI UANG PER KEBUTUHAN DALAM SATU BULAN =====');
for i:=1 to b_kebutuhan do
    begin
        writeln (butuh[i].nama,': ',butuh[i].pemasukan_perkebutuhan);
        butuh[i].sisa_perkebutuhan:= butuh[i].pemasukan_perkebutuhan - butuh[i].p_kebutuhan;
    end;
writeln;
end;

procedure tabell;
begin
    Persentase;
    hitungpersentotal;

    writeln;
    writeln('============================= TABEL PENGELUARAN =============================');
    writeln('| No | Nama Kebutuhan   |   Biaya (Rp) | Persen (%) |   Sisa Saldo (Rp) |');
    writeln('-------------------------------------------------------------------------------');

    for i := 1 to b_kebutuhan do
    begin
        with butuh[i] do
        begin
            writeln(
                '| ', i:2, ' | ',
                nama:16, ' | ',
                p_kebutuhan:12, ' | ',
                persen:10:2, ' | ',
                sisa_perkebutuhan:15, ' |'
            );
        end;
    end;

    writeln('-------------------------------------------------------------------------------');
    writeln('| Total Pengeluaran              : Rp ', total:10, '                         |');
    writeln('| Persentase Pengeluaran Total   : ', persen_total:6:2, '%                               |');
    writeln('| Sisa Uang Bulanan              : Rp ', sisa:10, '                         |');
    writeln('===============================================================================');
end;


begin
repeat
inputanUser;
porsikebutuhan;
input_keluaran;
writeln;
tabell;
write('ingin mengulang program??(y/n)'); readln(ulangan)
until (ulangan = 'n') or (ulangan = 'N');
end.

