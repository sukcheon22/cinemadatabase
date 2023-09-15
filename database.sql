Create table Dien_vien(
	Ma_dien_vien varchar(11) NOT NULL,
	Ten_dien_vien VARCHAR(30) NOT NULL,
    Quoc_tich VARCHAR(30),
    CONSTRAINT pk_Dien_vien PRIMARY KEY (Ma_dien_vien)
) ENGINE = InnoDB;

Create table Tai_khoan(
	Ma_tai_khoan VARCHAR(11) NOT NULL,
    Ten_khach_hang VARCHAR(255) NOT NULL,
    Ten_tai_khoan VARCHAR(50) NOT NULL,
    Mat_khau CHAR(20) NOT NULL,
    Email CHAR(100) not null,
    SDT CHAR(20) not null,
    Ngay_sinh DATE,
    CONSTRAINT pk_Tai_khoan PRIMARY KEY (Ma_tai_khoan)
    
) ENGINE = InnoDB;

Create table Hoa_don(
	Ma_hoa_don VARCHAR(15) not null,
    Tong_gia Varchar(9),
    Hinh_thuc_thanh_toan VARCHAR(50),
    Ma_tai_khoan Varchar(20) not null,
    Thoi_gian datetime,
    CONSTRAINT pk_Hoa_don PRIMARY KEY (Ma_hoa_don),
    foreign key (Ma_tai_khoan) references Tai_khoan(Ma_tai_khoan)
);
Create table Dat_ve(
	Ma_tai_khoan varchar(11) NOT NULL,
    Ma_hoa_don varchar(15) NOT NULL,
    
    FOREIGN KEY (Ma_tai_khoan) REFERENCES Tai_khoan(Ma_tai_khoan),
    Foreign key (Ma_hoa_don) references Hoa_don(Ma_hoa_don)
) ENGINE = InnoDB;

Create table Ve(
	Ma_ve VARCHAR(20) not null,
    Ma_hoa_don VARCHAR(20) not null,
    Gia_ve VARCHAR(9) not null,
    Ma_SC VARCHAR(20) not null,
    Ma_Ghe VARCHAR(20) not null,
    CONSTRAINT pk_Ve PRIMARY KEY (Ma_ve),
    Foreign key (Ma_hoa_don) references Hoa_don(Ma_hoa_don),
    foreign key (Ma_SC) references Suat_chieu(Ma_SC),
    foreign key (Ma_ghe) references Ghe(Ma_Ghe)
) ENGINE = InnoDB;
Create table Ghe(
	Ma_ghe Varchar(15) not null,
    Cot Int(20) not null,
    Hang Int(20) not null,
    Ma_phong varchar(15) not null,
    constraint pk_Ghe primary key (Ma_ghe),
    foreign key (Ma_phong) references Phong_chieu(Ma_phong)
);
Create table Phong_chieu(
	Ma_phong varchar(15) not null,
    Ten_phong varchar(30) not null,
    So_ghe int(200) ,
    Ma_rap varchar(20) not null,
    Loai_phong varchar(15) not null,
    Constraint pk_Phong_chieu primary key (Ma_phong),
    foreign key (Ma_rap) references Rap(Ma_rap)
);
Create table Suat_chieu(
	Ma_SC varchar(20) not null,
    Ma_phim varchar(20) not null,
    Ngay DATE not null,
    Bat_dau datetime not null,
    Ket_thuc datetime,
    Ma_rap varchar(15) not null,
    constraint pk_Suat_chieu primary key (Ma_SC),
    foreign key (Ma_phim) references Phim(Ma_phim),
    foreign key (Ma_rap) references Rap(Ma_rap)
);
Create table Phim(
	Ma_phim varchar(20) not null,
    Thoi_luong timestamp,
    Ten_phim varchar(30) not null,
    The_loai varchar(30),
    Do_tuoi int(20),
    constraint pk_Phim primary key (Ma_phim)
);
Create table Dao_dien(
	Ma_dao_dien varchar(20) not null,
    Ten_dao_dien varchar(40) not null,
    Quoc_tich varchar(20),
    constraint pk_Dao_dien primary key (Ma_dao_dien)
);
Create table Dong_phim(
	Ma_phim varchar(20) not null,
    Ma_dien_vien varchar(11) not null,
    foreign key (Ma_phim) references Phim(Ma_phim),
    foreign key (Ma_dien_vien) references Dien_vien(Ma_dien_vien)
);
Create table Chi_dao(
	Ma_phim varchar(20) not null,
    Ma_dao_dien varchar(20) not null,
    foreign key (Ma_phim) references Phim(Ma_phim),
    foreign key (Ma_dao_dien) references Dao_dien(Ma_dao_dien)
);
Create table Rap(
	Ma_rap varchar(15) not null,
    Dia_chi varchar(100) not null,
    Danh_gia float(2,2),
    constraint pk_Rap primary key (Ma_rap)
);