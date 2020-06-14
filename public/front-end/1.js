//header
//thanh điều hướng
$(function(){
    $('.navbar-toggler').click(function(event) {
       $('.cot9_trai').slideToggle(300);
    });
})


// slide product owl-carousel
$('.owl-carousel').owlCarousel({
    // loop:true,`
    margin:30,
    nav:true,
    responsive:{
        0:{
            items:1
        },
        576:{
            items:2
        },
        960:{
            items:3
        },
        1200:{
            items:4
        }
    }
})

// xử lý nút to Anchor
function scrollToAnchor(aid){
    var aTag = $("a[name='"+ aid +"']");
    $('html,body').animate({scrollTop: aTag.offset().top},'slow');
}

$("#link").click(function() {
   scrollToAnchor('top');
});

// zoom img
// var imgzoom = document.querySelector('.wrapper .content_chi_tiet_sp .container .content_top .cot4 img');

// imgzoom.click(function() {
//     alert('1');
// });