program tubes;
uses crt;
const
        nmax= 100;
type
        fb= record
        id: string;
        hp: string;
        email: string;
        kota: string;
        akun: string;
        biaya: longint;
        end;

var
        iden : array[1..nmax] of fb;
        N,p,k: integer;
        //N: integer;



        procedure pembukaan;
        begin
                writeln('-----Selamat datang di Facebook-----');
                writeln('========ENTER untuk lanjut==========');
                readln;
        end;


{/////////////////////////////////////////////////////////////////////////////////////////}

        function cekemail (iden : array of fb; emailp: string): boolean;
        var
                k :integer;
                found : boolean;
        begin

                found := FALSE;
                k := 1;
                        while (found = FALSE) and (k <= N) do
                        begin
                              if (iden[k].email = emailp) then
                                        begin
                                                found := TRUE;
                                        end;

                                        k := k + 1;
                        end;
                        cekemail := found;

        end;


{/////////////////////////////////////////////////////////////////////////////////}

        function ceknomer (iden : array of fb; nomer : string): boolean;
        var
                k :integer;
                found : boolean;
        begin

                found := FALSE;
                k := 1;
                        while (found = FALSE) and (k <= N) do
                        begin
                              if (iden[k].hp = nomer) then
                                        begin
                                                found := TRUE;
                                        end;

                                        k := k + 1;
                        end;
                        ceknomer := found;

        end;

{////////////////////////////////////////////////////////////////////}

        procedure daftar (var iden: array of fb; var N: integer);
        var
                i, j, benar,index, cekemail2: integer;
                yn,hp: string;
                emailx: string;
        begin
                i := 1;
                benar := 0;
                repeat
                        begin
                        benar :=0;
                        write('Masukan Nama: ');
                        readln(iden[i].id);
                        write('Masukan Email: ');
                        readln(emailx);
                        while cekemail(iden,emailx) do
                                begin
                                        writeln('Email yang anda masukan sudah terdaftar');
                                        write('Masukan Email: ');
                                        readln(emailx);
                                end;
                        iden[i].email := emailx;

                                for j := 1 to length(emailx) do
                                        begin
                                                if (emailx[j] = '@') then //{or (emailx[j] = '.com') or (emailx[j] = '.co.id'))} then
                                                        begin
                                                        benar := benar + 1;
                                                        end;
                                        end;

                                        if (benar = 1) then
                                                iden[i].email := emailx
                                        else
                                                begin
                                                writeln('Email anda salah');
                                                //write('Masukan Email: ');
                                                daftar(iden,N);
                                                end;

                        write('Masukan Nomor Hp: ');
                        readln(hp);
                        while ceknomer(iden,hp) do
                                begin
                                        writeln('No. yang anda masukan sudah terdaftar');
                                        write('Masukan Nomor Hp: ');
                                        readln(hp);
                                end;
                        iden[i].hp := hp;

                        write('Masukan Kota Anda: ');
                        readln(iden[i].kota);

                        writeln;
                        writeln('1. Akun bisnis tanpa iklan');
                        writeln('2. Akun bisnis dengan iklan');
                        writeln('3. Akun personal dengan iklan');
                        writeln('4. Akun personal tanpa iklan');
                        writeln('Pilih: ');
                        readln(iden[i].akun);
                        writeln;


                        case iden[i].akun of
                              '1': writeln('Akun bisnis tanpa iklan');
                              '2': writeln('Akun bisnis dengan iklan');
                              '3': writeln('Akun personal dengan iklan');
                              '4': writeln('Akun personal tanpa iklan');
                        end;

                        if (iden[i].akun = '1') then
                        begin
                                iden[i].biaya := 100000;
                                writeln('Akun bisnis tanpa iklan: ',iden[i].biaya);
                        end;
                        if (iden[i].akun = '2') then
                        begin
		                iden[i].biaya := 200000;
                                writeln('Akun bisnis dengan iklan: ',iden[i].biaya);
                        end;
                        if (iden[i].akun = '3') then
                        begin
                                iden[i].biaya := 50000;
                                writeln('Akun personal dengan iklan: ',iden[i].biaya);
                        end;
                        if (iden[i].akun = '4') then
                        begin
                                iden[i].biaya := 0;
                                writeln('gratis');
                        end;



                  write('Masih Ingin Input Lagi? (Yes or No) : ');
                  readln (yn);

		  if yn ='yes' then
                                begin
                                i := i + 1;
                                N := N + 1;
                                end;
                       end;

               until yn = 'no'

        end;

{////////////////////////////////////////////////////////////////////////////////////////////}

        procedure ceknama (iden : array of fb; N : integer);
        var
                k :integer;
                found : integer;
                x : string;
        begin
                write('Inputkan nama yang ingin anda cari : ');
                readln(x);

                found := -1;
                k := 1;
                        while (found = -1) and (k <= N) do
                        begin
                              if (iden[k].id = x) then
                                        begin
                                                found := k;
                                        end;

                                        k := k + 1;
                         end;

                if found = -1 then
                   writeln('Nama yang anda cari tidak ditemukan')
                else
                begin
                        writeln('Nama yang anda cari ditemukan.');
                        writeln('Nama: ',iden[found].id);
                        writeln('Nomor HP: ',iden[found].hp);
                        writeln('Email: ',iden[found].email);
                        writeln('Kota: ',iden[found].kota);
                        writeln('Jenis Akun: ',iden[found].akun);
                        writeln('Biaya: ',iden[found].biaya);
                end;

                write('tekan ENTER untuk selanjutnya'); readln;
        end;

{//////////////////////////////////////////////////////////////////////////////////////}

        function bublesort (var iden: array of fb; N: integer): integer;
        var
                i,j,sort: integer;
                temp: string;

        begin
                for  i:= 1 to N-1 do
                  begin
                        for j := 1 to N do
                                begin
                                  if (iden[j].kota > iden[j+1].kota) then
                                        begin
                                                temp := iden[j].kota;
                                                iden[j] := iden[j];
                                                iden[i+1].kota := temp;
                                        end;
                                end;
                  end;
                sort := bublesort(iden,N);
        end;


{////////////////////////////////////////////////////////////////////////////////////////////////////////}

        procedure tampilandata (var iden: array of fb; N:integer);
        var
                k: integer;
        begin
                k := 1;
                repeat
                        writeln('Nama: ',iden[k].id);
                        writeln('Email: ', iden[k].email);
                        writeln('No.Hp: ', iden[k].hp);
                        writeln('Kota: ', iden[k].kota);
                        writeln('Akun: ', iden[k].akun);
                        writeln('Biaya: ', iden[k].biaya);

                        writeln;
                        k := k + 1;
                until (k > N);
        end;

{////////////////////////////////////////////////////////////////////}

        procedure tampilansorting (var iden:array of fb; N:integer);
        begin
                        tampilandata(iden,N);
        end;



{/////////////////////////////////////////////////////////////////////////////////////////}



{/////////////////////////////////////////////////////////////////////////////////////////////////////}
        procedure menupilih (p:integer);
        var
                pili: string;
                ceknama2:integer;
                buble,x :string;
        begin

                repeat
                        writeln('================MENU===================');
                        writeln('a. Tampilkan jumlah akun');
                        writeln('b. cari nama');
                        writeln('c. keluar');
                        writeln('d. bublesort');
                        writeln('e. edit akun');

                        write('Pilih: ');
                        readln(pili);
                        if (pili = 'a') then
                                tampilandata(iden,N);
                        if (pili = 'b') then
                                 ceknama(iden,N);
                        if (pili = 'c') then
                                pembukaan;
                        if (pili = 'd') then
                                bublesort(iden,N);
                        if (pili = 'e') then


                until (pili = 'c');

        end;
begin
        N := 1;
        pembukaan;
        writeln;
        daftar(iden,N);
        writeln;
        menupilih(p);


end.
