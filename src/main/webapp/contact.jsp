<%-- 
    Document   : contact
    Created on : 31 Des 2025, 09.30.02
    Author     : MyBook Hype AMD
--%>

<title>Informasi Kontak Kost</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

<style>
    .contact-section {
        background:#ffffff;
        padding: 100px 0;
        color: #e5e7eb;
    }

    .contact-title {
        font-size: 48px;
        font-weight: 700;
        color: #000;
    }

    .contact-title span {
        color: #000;
    }

    .contact-subtitle {
        max-width: 700px;
        margin: auto;
        color: #333333;
    }

    .contact-card {
        background: rgba(30,41,59,0.95);
        border-radius: 20px;
        padding: 35px;
        height: 100%;
        box-shadow: 0 20px 40px rgba(0,0,0,.35);
    }

    .card-title {
        font-size: 20px;
        margin-bottom: 25px;
        font-weight: 600;
    }

    .info-item {
        display: flex;
        gap: 16px;
        margin-bottom: 22px;
    }

    .info-item i {
        font-size: 22px;
        color: #8b5cf6;
        margin-top: 4px;
    }

    .info-item p {
        margin: 0;
        color: #cbd5e1;
    }

    .form-control {
        background: #334155;
        border: none;
        color: white;
        padding: 12px;
    }

    .form-control::placeholder {
        color: #94a3b8;
    }

    .form-control:focus {
        background: #334155;
        color: white;
        box-shadow: 0 0 0 2px rgba(139,92,246,.5);
    }

    .btn-submit {
        background: linear-gradient(90deg,#7c3aed,#6366f1);
        border: none;
        padding: 14px;
        border-radius: 10px;
        color: white;
        font-weight: 600;
    }
</style>
</head>
<body>

    <section class="contact-section">
        <div class="container">

            <!-- JUDUL -->
            <div class="text-center mb-5">
                <h1 class="contact-title">
                    Hubungi <span>Kami</span>
                </h1>
                <p class="contact-subtitle">
                    Punya pertanyaan atau membutuhkan bantuan? Kami siap membantu Anda.
                </p>
            </div>

            <!-- KONTEN -->
            <div class="row g-4">
                <!-- KIRI -->
                <div class="col-lg-5">
                    <div class="contact-card">
                        <h5 class="card-title">Informasi Kontak</h5>

                        <div class="info-item">
                            <i class="bi bi-geo-alt-fill"></i>
                            <div>
                                <strong>Kantor Pusat</strong>
                                <p>Jl. Sudirman No. 123<br>Jakarta Pusat, 10220</p>
                            </div>
                        </div>

                        <div class="info-item">
                            <i class="bi bi-telephone-fill"></i>
                            <div>
                                <strong>Layanan Pelanggan</strong>
                                <p>+6288 296 528 953<br>Bebas Pulsa: 0800-123-4567</p>
                            </div>
                        </div>

                        <div class="info-item">
                            <i class="bi bi-envelope-fill"></i>
                            <div>
                                <strong>Dukungan Email</strong>
                                <p>info@smartkost.com<br>support@smartkost.com</p>
                            </div>
                        </div>

                        <div class="info-item">
                            <i class="bi bi-clock-fill"></i>
                            <div>
                                <strong>Jam Operasional</strong>
                                <p>Senin - Jumat: 08.00 - 20.00<br>
                                    Sabtu - Minggu: 09.00 - 18.00</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- KANAN -->
                <div class="col-lg-7">
                    <div class="contact-card">
                        <h5 class="card-title">Kirim Pesan</h5>

                        <form>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label>Nama Anda</label>
                                    <input type="text" class="form-control" placeholder="Rozi">
                                </div>
                                <div class="col-md-6">
                                    <label>Email</label>
                                    <input type="email" class="form-control" placeholder="zhie@email.com">
                                </div>

                                <div class="col-12">
                                    <label>Nomor Telepon</label>
                                    <input type="text" class="form-control" placeholder="+62 xxx xxxx xxxx">
                                </div>

                                <div class="col-12">
                                    <label>Pesan</label>
                                    <textarea class="form-control" rows="4"
                                              placeholder="Bagaimana kami bisa membantu Anda?"></textarea>
                                </div>

                                <div class="col-12">
                                    <button class="btn-submit w-100">
                                        Kirim Pesan
                                    </button>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>

        </div>
    </section>
