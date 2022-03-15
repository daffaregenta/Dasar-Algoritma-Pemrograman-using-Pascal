Program PendaftaranAkunFB;
uses crt;
Type
	akun = record
	nama : string;
	nomor :  string;
	email : string;
	kota : string;
	jenisAkun : char;
	biaya : longint;
end;
var
	N : integer;
	data : array[1..100] of akun;


{---------------------------------------------------------------------------------------------------------}
	Procedure Pembukaan;
	begin
		clrscr;
			writeln ('=======================================');
			writeln ('***       WELCOME TO FACEBOOK      ***');
			writeln ('***		SELAMAT MENDAFTAR!!      ***');
			writeln ('***--------------------------------***');
			writeln ('***  SILAHKAN TEKAN TOMBOL ENTER   ***');
			writeln ('*** 		UNTUK MELANJUTKAN        ***');
			writeln ('**************************************');
		readln;
	end;


{---------------------------------------------------------------------------------------------------------}
	Function cariNomor ( nn : string) : integer;
	var
		x,temp : integer;
		found : boolean;
	begin
		found := FALSE;
		temp := -1;
		x := 1;
			while (not found) and (x <= N) do
			begin
				if (data[x].nomor = nn) then
					begin
						found := TRUE;
						temp := x;
					end
				else
					x := x + 1;
			end;

			cariNomor := temp;
	end;

	Procedure DaftarAkun (var data : array of akun);
	var
		xnomor, pil,nama2,nomor2,mail : string;
		index,i,j,benar : integer;
	begin
		i := 1;
		N := 1;
		j := 1;
		benar := 0;
		repeat
			begin
				writeln ('Nama :');
				readln (nama2);
				writeln ('Nomor : ');
				readln (nomor2);
				xnomor := nomor2;
				index := cariNomor (xnomor);
					repeat
						begin
							if index <> -1 then
							begin
								writeln ('maaf sudah terdaftar');
								writeln ('--------------------');
								writeln ('Nomor :');
								readln (data[i].nomor);
			       			end;
						end;
					until (index = -1);
				writeln ('Email :');
				readln(mail);
				//data[i].email := mail;
				//readln (data[i].email);
					for j:=1 to length(mail) do
						begin
							if (mail[j] = '@') then
								begin
									benar := benar + 1; {var benar itu untuk apa?}
								end;
							///else
								{begin
									write ('Email :');
									readln (data[j].email);
								end;}
						end;
						if (benar = 1) then
							begin
								data[i].email := mail;
								data[i].nama := nama2;
								data[i].nomor := nomor2;
							end
						else
							begin
								writeln ('inputan email anda salah');
								DaftarAkun (data);
							end;
				writeln ('Kota : ');
				readln (data[i].kota);
				writeln ('Jenis Akun : ');
				writeln ('a. bisnis dengan iklan');
				writeln ('b. bisnis tanpa iklan');
				writeln ('c. personal dengan iklan');
				writeln ('d. personal tanpa iklan');
				readln (data[i].jenisAkun);
				case data[i].jenisAkun of
					'a' : write ('bisnis dengan iklan');
					'b' : write ('bisnis tanpa iklan');
					'c' : write ('personal dengan iklan');
					'd' : write ('personal tanpa iklan');
				end;

					if (data[i].jenisAkun = 'a') then
						data[i].biaya := 200000;
                                                writeln('bisnin dengan iklan: ',data[i].biaya);
				         if (data[i].jenisAkun = 'b') then
						data[i].biaya := 100000
					else if (data[i].jenisAkun = 'c') then
					 	data[i].biaya := 50000
					else
						data[i].biaya := 0;
				write ('Masih Ingin Input Lagi? (Yes or No) : ');
				readln (pil);
				if ((pil ='Yes') or (pil= 'yes')) then
					begin
						i := i + 1;
						N := N + 1;
					end;
			end;
		until ((pil ='No') or (pil='no'));
	end;
{---------------------------------------------------------------------------------------------------------}

{---------------------------------------------------------------------------------------------------------}
	Function cariNama ( nn : string) : integer;
	var
		p, temp : integer;
		found : boolean;
	begin
		found := FALSE;
		temp := -1;
		p := 1;
			while (not found) and (p <= N) do
			begin
				if (data[p].nama = nn) then
					begin
						found := TRUE;
						temp := p;
					end
				else
					p := p + 1;
			end;

			cariNama := temp;
	end;


{--------------------------------------------------------------------------------------------------------}
Procedure ShowAkun (m : integer);
	begin
		clrscr;
				write ('*****************************************');
				write ('**   Nama : ', data[m].nama,          '**');
				write ('**   Nomor HP : ', data[m].nomor,     '**');
				write ('**   Email : ',data[m].email,         '**');
				write ('**   Kota : ',data[m].kota,           '**');
				write ('**   Jenis Akun : ',data[m].jenisAkun,'**');
				write ('**   Biaya : ',data[m].biaya,         '**');
				write ('******************************************');
				write ('**       Press enter for EXIT          **');
				write ('*****************************************');
	end;


{--------------------------------------------------------------------------------------------------------}
Procedure akuntidakada;
	begin
		clrscr;
				write ('*****************************************');
				write ('**            AKUN FACEBOOK            **');
				write ('**   TIDAK ADA ATAU TELAH DIHAPUS      **');
				write ('*****************************************');
				write ('**       TEKAN ENTER UNTUK KELUAR      **');
				write ('*****************************************');
	end;


{---------------------------------------------------------------------------------------------------------}
	Procedure menulihatakun;
	var
		xnama : string;
		index : integer;
		//data : Akun;
	begin
		clrscr;
		writeln('**************************************');
		writeln('**								     **');
		writeln('** 		  SELAMAT DATANG		 **');
		writeln('** SILAHKAN MASUKKAN NAMA ANDA UNTUK**');
		writeln('**	      MELIHAT INFO AKUN ANDA     **');
		writeln('** 								 **');
		writeln('**************************************');
		writeln ('Masukkan Nama Lengkap Anda :');
		readln (xnama);

		index := cariNama(xnama);

		if index <> -1 then
			ShowAkun (index)
		else
			akuntidakada;
	end;

{---------------------------------------------------------------------------------------------------------}

{---------------------------------------------------------------------------------------------------------}
procedure berhasiledit;
	begin
		clrscr;
		writeln ('**************************************');
		writeln ('**	     AKUN FACEBOOK ANDA       **');
		writeln ('** 	   TELAH BERHASIL DIEDIT      **');
		writeln ('**************************************');
		writeln ('** 	TEKAN ENTER UNTUK KELUAR	  **');
		writeln ('**************************************');
	end;



{--------------------------------------------------------------------------------------------------------}

{---------------------------------------------------------------------------------------------------------}
procedure menueditakun2 (index : integer);
	var
		yn : string;
	begin
		clrscr;
		writeln ('**************************************');
		writeln ('**		INFO AKUN FACEBOOK        **');
		writeln ('--------------------------------------');
		writeln ('**    Nama : ', data[index].nama);
		writeln ('**	Nomor HP : ', data[index].nomor);
		writeln ('**	Email : ', data[index].email);
		writeln ('** 	Kota : ', data[index].kota);
		writeln ('**	Jenis Akun : ', data[index].jenisAkun);
		writeln ('**----------------------------------**');
		writeln ('**		PENGEDITAN AKUN FB		  **');
		writeln ('**----------------------------------**');
		writeln ('**    Nama : '); readln(data[index].nama);
		writeln ('**	Nomor HP : '); readln(data[index].nomor);
		writeln ('**	Email : '); readln(data[index].email);
		{MASUKKIN LOOPING YG NGE CEK EMAIL DISINI}
		writeln ('** 	Kota : '); readln(data[index].kota);
		writeln ('**	Jenis Akun : '); readln(data[index].jenisAkun);
		writeln ('**************************************');
		writeln ('Apakah anda yakin dengan pengeditan ini? (yes or no');
		readln (yn);
		repeat
			if yn = 'yes' then
				berhasiledit
			{else
				menueditbio2(index);}
		until (yn = 'yes') or (yn = 'no');
	end;



	Procedure menueditakun;
	var
		xnomor : string;
		index : integer;
	begin
			clrscr;
			writeln('**************************************');
			writeln('** 		  SELAMAT DATANG		 **');
			writeln('** SILAHKAN MASUKKAN NOMOR HP ANDA  **');
			writeln('**	      UNTUK MENGEDIT INFO        **');
			writeln('** 		    AKUN ANDA			 **');
			writeln('**************************************');
			writeln('Masukkan nomor hp anda :');
			readln(xnomor);

			index := cariNomor(xnomor);

			if (index <> -1) then
				begin
					menueditakun2 (index);
				end;
	end;


{---------------------------------------------------------------------------------------------------------}



{---------------------------------------------------------------------------------------------------------}
	procedure telahdihapus;
	begin
		clrscr;
		writeln ('**************************************');
		writeln ('**	     AKUN FACEBOOK ANDA       **');
		writeln ('** 	       TELAH DIHAPUS          **');
		writeln ('**************************************');
		writeln ('** 	TEKAN ENTER UNTUK KELUAR	  **');
		writeln ('**************************************');
	end;


	procedure menuhapusakun;
	var
		xnomor ,pil : string;
		index ,j : integer;
		temp : akun ;
	begin
			clrscr;
			writeln('**************************************');
			writeln('** 		  SELAMAT DATANG		 **');
			writeln('** SILAHKAN MASUKKAN NOMOR HP ANDA  **');
			writeln('**	      UNTUK MENGEDIT INFO        **');
			writeln('** 		    AKUN ANDA			 **');
			writeln('**************************************');
			writeln('Masukkan nomor hp anda :');
			readln(xnomor);

			index := cariNomor(xnomor);

			if index <> -1 then
			begin
				telahdihapus;
				writeln('Apakah ada yakin akan menghapus akun facebook ini? (yes or no)');
				readln (pil) ;
				if pil = 'yes' then
					begin
						data[index].nama := ' ';
						data[index].nomor :=  ' ';
						data[index].email := ' ';
						data[index].kota := ' ';
						data[index].jenisAkun := ' ';
						data[index].biaya := 0;

						for j := 1 to N-1 do
							begin
								if (data[j].nama = ' ') and (data[j].nomor = ' ') and (data[j].email = ' ')
								and (data[j].kota = ' ') and (data[j].jenisAkun = ' ') and (data[j].biaya = 0) then
									begin
										temp := data[j];
										data[j] := data[j+1];
										data[j+1] := temp;
									end;
							end;
							N := N - 1;
							telahdihapus;

					end
				else if pil = 'no'	then
					begin

					end;
			end;
			readln;
	end;


{---------------------------------------------------------------------------------------------------------}



{---------------------------------------------------------------------------------------------------------}
	Procedure Sorting (var data : array of akun; N : integer);
	var
		nn, now, k : integer;
		temp : string;
	begin
		nn := N;
		now := 2;
		while (now <= nn) do
			begin
				temp := data[now].kota;
				k := now;
					while (k > 1) and (data[k-1].kota > temp) do
						begin
							data[k].kota := data[k-1].kota;
							k := k -1;
						end;
				data[k].kota := temp;
				now := now + 1;
			end;
	end;

{---------------------------------------------------------------------------------------------------------}
Procedure tampilansort;
	var
		m : integer;
		s : array[1..100] of akun;
	begin
		for m := 1 to N do
			begin
				Sorting(s,N);
				if (s[m].nama <> ' ') then
					ShowAkun(m);
				{end if}
			end;
	end;



{---------------------------------------------------------------------------------------------------------}
Procedure MenuResmi;
	var
		nmr : integer;
	begin
		repeat
		clrscr;
			writeln('**************************************');
			writeln('**									 **');
			writeln('**    APA YANG INGIN ANDA LAKUKAN?  **');
			writeln('**	     1. Lihat info akun anda     **');
			writeln('**		 2. Pengeditan akun anda     **');
			writeln('**      3. Hapus akun anda          **');
			writeln('**      4. Lihat Data Pendaftar	 **');
			writeln('**			Sesuai Nama Kota	     **');
			writeln('**                                  **');
			writeln('**							0.Keluar **');
			writeln('**                                  **');
			writeln('**************************************');
			writeln('Masukan Pilihan : ');
			readln(nmr);
			case nmr of
				1 : menulihatakun;
				2 : menueditakun;
				3 : menuhapusakun;
				4 : tampilansort;
				0 : begin

					end;
			end;
			until (nmr=0);
	end;

{---------------------------------------------------------------------------------------}

BEGIN {MAIN ALGO}


	Pembukaan;
	writeln;
	DaftarAkun(data);
	MenuResmi;

END.
