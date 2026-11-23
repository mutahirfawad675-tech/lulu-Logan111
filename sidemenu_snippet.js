  // GLOBAL SIDE MENU INITIALIZATION
  (function initGlobalSideMenu() {
    var sideMenu = document.getElementById('global-sidemenu');
    var openButtons = document.querySelectorAll('.hamburger-btn, #hamburgerBtn, #hamburger-btn, .nav-hamburger, [data-action="open-menu"]');
    var closeButton = document.getElementById('sideMenuClose');

    if (!sideMenu) return;

    function openMenu() {
      sideMenu.classList.add('visible');
      sideMenu.setAttribute('aria-hidden', 'false');
      document.body.style.overflow = 'hidden';
    }

    function closeMenu() {
      sideMenu.classList.remove('visible');
      sideMenu.setAttribute('aria-hidden', 'true');
      document.body.style.overflow = '';
    }

    openButtons.forEach(function(btn) {
      btn.addEventListener('click', function(e) {
        e.preventDefault();
        openMenu();
      });
    });

    if (closeButton) {
      closeButton.addEventListener('click', function(e) {
        e.preventDefault();
        closeMenu();
      });
    }

    sideMenu.addEventListener('click', function(e) {
      if (e.target === sideMenu || e.target.classList.contains('sidemenu-wrapper')) {
        closeMenu();
      }
    });

    document.addEventListener('keydown', function(e) {
      if (e.key === 'Escape' && sideMenu.classList.contains('visible')) {
        closeMenu();
      }
    });

    var subNavContainers = sideMenu.querySelectorAll('.sub-nav-container');
    subNavContainers.forEach(function(container) {
      var mainNav = container.querySelector('.main-nav');
      if (mainNav) {
        mainNav.addEventListener('click', function(e) {
          e.preventDefault();
          e.stopPropagation();
          container.classList.toggle('open');
        });
      }
    });
  })();
