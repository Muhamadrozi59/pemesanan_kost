<%@ page session="true" %>

<div class="bg-white shadow rounded-xl px-6 py-3 flex items-center justify-between">

    <!-- SEARCH -->
    <div class="flex items-center gap-3 text-gray-400 w-full max-w-md">
        <input type="text" placeholder="Search..."
               class="w-full border-none focus:ring-0 outline-none text-sm text-gray-600"/>
    </div>

    <!-- RIGHT -->
    <div class="flex items-center gap-6 relative">

        <a href="#" class="text-indigo-500 text-sm font-medium hover:underline">
            Star
        </a>

        <!-- AVATAR -->
        <div class="relative">

            <img src="image/Biyao.jpeg"
                 onclick="toggleMenu(event)"
                 class="w-9 h-9 rounded-full border cursor-pointer"/>

            <!-- DROPDOWN -->
            <div id="userMenu"
                 class="absolute right-0 mt-3 w-56 bg-white rounded-xl shadow-lg border hidden z-50">

                <div class="flex items-center gap-3 p-4 border-b">
                    <img src="image/Biyao.jpeg" class="w-10 h-10 rounded-full"/>
                    <div>
                        <p class="font-semibold text-sm">
                            <%= session.getAttribute("user")%>
                        </p>
                        <p class="text-xs text-gray-400">Admin</p>
                    </div>
                </div>
                <a href="profile.jsp" class="flex items-center gap-3 px-4 py-2 text-sm hover:bg-gray-100">
                    <svg class="w-4 h-4 text-gray-600" fill="none" stroke="currentColor" stroke-width="2"
                         viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round"
                          d="M5.121 17.804A4 4 0 0112 15a4 4 0 016.879 2.804M15 11a3 3 0 11-6 0 3 3 0 016 0z"/>
                    </svg>
                    My Profile
                </a>


                <a href="index.jsp"
                   class="flex items-center gap-3 px-4 py-2 text-sm text-red-600 hover:bg-gray-100">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2"
                         viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round"
                          d="M17 16l4-4m0 0l-4-4m4 4H7"/>
                    </svg>
                    Log Out
                </a>


            </div>
        </div>

    </div>
</div>
<script>
    const menu = document.getElementById("userMenu");

    function toggleMenu(e) {
        e.stopPropagation();
        menu.classList.toggle("hidden");
    }

    document.addEventListener("click", function () {
        menu.classList.add("hidden");
    });

    menu.addEventListener("click", function (e) {
        e.stopPropagation();
    });
</script>
