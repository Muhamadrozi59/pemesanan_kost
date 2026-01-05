<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Kost Ku</title>

    <link href="css/bootstrap.min.css" rel="stylesheet" />

    <!-- FONT AWESOME (ICON TELEPON, LOKASI, JAM) -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>

<!-- NAVBAR -->
<%@ include file="menu.jsp" %>

<!-- KONTEN -->
<div class="container mt-4">
    <div class="row">
        <div class="col-12">
            <jsp:include page="main.jsp" />
        </div>
    </div>
</div>

<!-- FOOTER -->
<%@ include file="footer.jsp" %>

<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
