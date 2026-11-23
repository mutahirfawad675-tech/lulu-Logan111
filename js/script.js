/**
 * JUST 1 REAL ESTATE - MAIN JAVASCRIPT
 * Accurate replica of interactive functionality
 */

document.addEventListener('DOMContentLoaded', () => {
  // ----------------------------------------------------
  // 1. NAVBAR SCROLL EFFECT
  // ----------------------------------------------------
  const navbar = document.getElementById('global-navbar');
  
  const handleScroll = () => {
    if (window.scrollY > 50) {
      navbar.classList.add('scrolled');
    } else {
      navbar.classList.remove('scrolled');
    }
  };

  window.addEventListener('scroll', handleScroll, { passive: true });
  handleScroll(); // Initial check

  // ----------------------------------------------------
  // 2. SIDE MENU TOGGLE
  // ----------------------------------------------------
  const sideMenu = document.getElementById('sideMenu');
  const sideMenuOverlay = document.getElementById('sideMenuOverlay');
  const hamburgerBtn = document.getElementById('hamburgerBtn');
  const sideMenuClose = document.getElementById('sideMenuClose');

  const openSideMenu = () => {
    sideMenu.classList.add('open');
    sideMenuOverlay.classList.add('open');
    document.body.style.overflow = 'hidden';
  };

  const closeSideMenu = () => {
    sideMenu.classList.remove('open');
    sideMenuOverlay.classList.remove('open');
    document.body.style.overflow = '';
  };

  if (hamburgerBtn) hamburgerBtn.addEventListener('click', openSideMenu);
  if (sideMenuClose) sideMenuClose.addEventListener('click', closeSideMenu);
  if (sideMenuOverlay) sideMenuOverlay.addEventListener('click', closeSideMenu);

  // Side menu accordions
  const sideDropdownLinks = document.querySelectorAll('.side-menu-dropdown-toggle');
  sideDropdownLinks.forEach(toggle => {
    toggle.addEventListener('click', (e) => {
      e.preventDefault();
      const submenu = toggle.nextElementSibling;
      if (submenu) {
        submenu.classList.toggle('open');
      }
    });
  });

  // ----------------------------------------------------
  // 3. TEAM CAROUSEL SLIDER
  // ----------------------------------------------------
  const teamTrack = document.getElementById('teamCarouselTrack');
  const teamPrevBtn = document.getElementById('teamPrevBtn');
  const teamNextBtn = document.getElementById('teamNextBtn');
  let currentTeamIndex = 0;

  const updateTeamSlider = () => {
    if (!teamTrack) return;
    const cards = teamTrack.querySelectorAll('.team-card');
    if (!cards.length) return;

    const cardWidth = cards[0].offsetWidth;
    const gap = 24;
    const visibleCards = window.innerWidth <= 480 ? 1 : window.innerWidth <= 768 ? 2 : window.innerWidth <= 1200 ? 3 : 5;
    const maxIndex = Math.max(0, cards.length - visibleCards);

    currentTeamIndex = Math.min(Math.max(currentTeamIndex, 0), maxIndex);
    const offset = -(currentTeamIndex * (cardWidth + gap));
    teamTrack.style.transform = `translateX(${offset}px)`;
  };

  if (teamPrevBtn) {
    teamPrevBtn.addEventListener('click', () => {
      currentTeamIndex--;
      updateTeamSlider();
    });
  }

  if (teamNextBtn) {
    teamNextBtn.addEventListener('click', () => {
      currentTeamIndex++;
      updateTeamSlider();
    });
  }

  window.addEventListener('resize', updateTeamSlider);

  // ----------------------------------------------------
  // 4. TESTIMONIALS SLIDER
  // ----------------------------------------------------
    const testimonials = [
    {
      quote: "Lulu and the Just 1 Real Estate team are absolutely amazing! They're helped us navigate multiple transactions across Manteca, Lathrop, Mountain House, and Oakdale with professionalism, deep market knowledge, and solid dedication, strategic guidance, and personal care made every step seamless. Truly a one-of-a-kind team that treats you like family while delivering expert results. Highly recommend!",
      author: "— SAM N."
    },
    {
      quote: "Lulu, At Just 1Real Estate is fantastic. You couldn't ask for a better experience. She's knowledgeable about the properties she's selling, and I would recommend her to anyone interested in purchasing a home. So go see Lulu, if you're looking for a home.",
      author: "— DIANNA"
    },
    {
      quote: "I had a great experience with Lulu , she did a great job handling everything from the very beginning to the very end. I highly recommend her and team!",
      author: "— MARK K."
    }
  ];

  let currentTestimonial = 0;
  const quoteElem = document.getElementById('testimonialQuote');
  const authorElem = document.getElementById('testimonialAuthor');
  const testPrevBtn = document.getElementById('testPrevBtn');
  const testNextBtn = document.getElementById('testNextBtn');

  const renderTestimonial = () => {
    if (!quoteElem || !authorElem) return;
    quoteElem.style.opacity = '0';
    authorElem.style.opacity = '0';
    setTimeout(() => {
      quoteElem.textContent = testimonials[currentTestimonial].quote;
      authorElem.textContent = testimonials[currentTestimonial].author;
      quoteElem.style.opacity = '1';
      authorElem.style.opacity = '1';
    }, 200);
  };

  if (testPrevBtn) {
    testPrevBtn.addEventListener('click', () => {
      currentTestimonial = (currentTestimonial - 1 + testimonials.length) % testimonials.length;
      renderTestimonial();
    });
  }

  if (testNextBtn) {
    testNextBtn.addEventListener('click', () => {
      currentTestimonial = (currentTestimonial + 1) % testimonials.length;
      renderTestimonial();
    });
  }

  // ----------------------------------------------------
  // 5. FEATURED PROPERTIES TOGGLE
  // ----------------------------------------------------
  const propPrevBtn = document.getElementById('propPrevBtn');
  const propNextBtn = document.getElementById('propNextBtn');
  const propertyCards = document.querySelectorAll('.property-card');

  if (propPrevBtn && propNextBtn && propertyCards.length > 2) {
    let propOffset = 0;
    const updateProperties = () => {
      propertyCards.forEach((card, idx) => {
        if (idx >= propOffset && idx < propOffset + 2) {
          card.style.display = 'flex';
        } else {
          card.style.display = 'none';
        }
      });
    };

    propNextBtn.addEventListener('click', () => {
      if (propOffset + 2 < propertyCards.length) {
        propOffset += 2;
        updateProperties();
      }
    });

    propPrevBtn.addEventListener('click', () => {
      if (propOffset - 2 >= 0) {
        propOffset -= 2;
        updateProperties();
      }
    });
  }

  // ----------------------------------------------------
  // 6. CONTACT US MODAL
  // ----------------------------------------------------
  const contactModal = document.getElementById('contactModal');
  const contactModalClose = document.getElementById('contactModalClose');
  const contactTriggers = document.querySelectorAll('[data-open-modal="contact"]');

  const openContactModal = (e) => {
    if (e) e.preventDefault();
    if (contactModal) {
      contactModal.classList.add('open');
      document.body.style.overflow = 'hidden';
    }
  };

  const closeContactModal = () => {
    if (contactModal) {
      contactModal.classList.remove('open');
      document.body.style.overflow = '';
    }
  };

  contactTriggers.forEach(btn => btn.addEventListener('click', openContactModal));
  if (contactModalClose) contactModalClose.addEventListener('click', closeContactModal);
  if (contactModal) {
    contactModal.addEventListener('click', (e) => {
      if (e.target === contactModal) closeContactModal();
    });
  }

  // ----------------------------------------------------
  // 7. FORM SUBMISSIONS
  // ----------------------------------------------------
  const contactForm = document.getElementById('contactModalForm');
  if (contactForm) {
    contactForm.addEventListener('submit', (e) => {
      e.preventDefault();
      const submitBtn = contactForm.querySelector('button[type="submit"]');
      const originalText = submitBtn.textContent;
      submitBtn.textContent = 'SENDING...';
      submitBtn.disabled = true;

      setTimeout(() => {
        alert('Thank you for contacting Lulu Logan Group! We have received your inquiry and will reach out shortly.');
        contactForm.reset();
        submitBtn.textContent = originalText;
        submitBtn.disabled = false;
        closeContactModal();
      }, 700);
    });
  }

  const newsletterForm = document.getElementById('footerNewsletterForm');
  if (newsletterForm) {
    newsletterForm.addEventListener('submit', (e) => {
      e.preventDefault();
      const input = newsletterForm.querySelector('input[type="email"]');
      const checkbox = newsletterForm.querySelector('input[type="checkbox"]');
      
      if (!checkbox.checked) {
        alert('Please accept the consent terms before subscribing.');
        return;
      }

      alert(`Thank you for subscribing with ${input.value}! Exclusive real estate listings and updates are on their way.`);
      newsletterForm.reset();
    });
  }
});


  // Video thumbnail inline player swap
  const videoWrap = document.querySelector('.video-thumbnail-wrap');
  if (videoWrap) {
    videoWrap.addEventListener('click', function() {
      const url = this.getAttribute('data-video-url') || 'https://www.youtube.com/embed/-KksMDhrlAY?autoplay=1';
      this.innerHTML = '<iframe src="' + url + '" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;"></iframe>';
    });
  }
