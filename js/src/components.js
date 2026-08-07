// Import all Eddie web components used on the book site.
//
// The engagement modal on interior/chapter pages adopts Eddie's <ed-modal>
// (see _includes/course-modal.html + js/course-cta.js). The modal renders an
// <ed-button> close control, which in turn renders an <ed-icon>, so all three
// component definitions must be registered.
import "@brad-frost-web/eddie-web-components/components/modal/modal.js";
import "@brad-frost-web/eddie-web-components/components/button/button.js";
import "@brad-frost-web/eddie-web-components/components/icon/icon.js";
