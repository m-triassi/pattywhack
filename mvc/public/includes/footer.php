<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">



<style>
    .image {
        height: 30px;
    }
    
/* /!\ You need to add vendor prefixes in order to render the CSS properly (or simply use http://leaverou.github.io/prefixfree/) /!\ */ #tridiv {
  perspective: 800px;
  position: absolute;
  overflow: hidden;
  width: 100%;
  height: 100%;
  background: transparent;
  font-size: 100%;
}
.face {
  box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.4);
}
.scene, .shape, .face, .face-wrapper, .cr {
  position: absolute;
  transform-style: preserve-3d;
}
.scene {
  width: 80em;
  height: 80em;
  top: 70%;
  left: 70%;
  margin: -40em 0 0 -40em;
}
.shape {
  top: 50%;
  left: 50%;
  width: 0;
  height: 0;
  transform-origin: 50%;
}
.face, .face-wrapper {
  overflow: hidden;
  transform-origin: 0 0;
  backface-visibility: hidden;
  /* hidden by default, prevent blinking and other weird rendering glitchs */
}
.face {
  background-size: 100% 100%!important;
  background-position: center;
}
.face-wrapper .face {
  left: 100%;
  width: 100%;
  height: 100%
}
.photon-shader {
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%
}
.side {
  left: 50%;
}
.cr, .cr .side {
  height: 100%;
}
[class*="cuboid"] .ft, [class*="cuboid"] .bk {
  width: 100%;
  height: 100%;
}
[class*="cuboid"] .bk {
  left: 100%;
}
[class*="cuboid"] .rt {
  transform: rotateY(-90deg) translateX(-50%);
}
[class*="cuboid"] .lt {
  transform: rotateY(90deg) translateX(-50%);
}
[class*="cuboid"] .tp {
  transform: rotateX(90deg) translateY(-50%);
}
[class*="cuboid"] .bm {
  transform: rotateX(-90deg) translateY(-50%);
}
[class*="cuboid"] .lt {
  left: 100%;
}
[class*="cuboid"] .bm {
  top: 100%;
}
/* .cub-1 styles */
.cub-1 {
  transform:translate3D(-0.3125em, 0em, 0.0625em) rotateX(0deg) rotateY(0deg) rotateZ(0deg);
  opacity:1;
  width:33.125em;
  height:28em;
  margin:-14em 0 0 -16.5625em;
}
.cub-1 .ft {
  transform:translateZ(19.75em);
}
.cub-1 .bk {
  transform:translateZ(-19.75em) rotateY(180deg);
}
.cub-1 .rt, .cub-1 .lt {
  width:39.5em;
  height:28em;
}
.cub-1 .tp, .cub-1 .bm {
  width:33.125em;
  height:39.5em;
}
.cub-1 .face {
  background-color:#FFFFFF;
}
    
    /* Animations */
.cub-1 {
    -webkit-animation: rotation 25s infinite linear;
}
    
@-webkit-keyframes rotation {
    from {-webkit-transform: rotateY(0deg);}
    to   {-webkit-transform: rotateY(359deg);}
}
</style>


<div id="tridiv" style="z-index: -1; position: fixed;">
  <div class="scene" style="-webkit-transform:rotateX(-15deg) rotateY(154deg); -moz-transform:rotateX(-15deg) rotateY(154deg); -ms-transform:rotateX(-15deg) rotateY(154deg); transform:rotateX(-15deg) rotateY(154deg); ">
    <div class="shape cuboid-1 cub-1">
      <div class="face ft"></div>
      <div class="face bk"></div>
      <div class="face rt"></div>
      <div class="face lt"></div>
      <div class="face bm"></div>
      <div class="face tp"></div>
    </div>
  </div>
</div>


<nav class="navbar navbar-default navbar-fixed-bottom">
    <ul class="nav navbar-nav">
        
           
            <span class="navbar-brand">Share us On Social Media!</span> 
                <!-- Reddit -->
                <a class="navbar-brand" href="http://reddit.com/submit?url=https://PattyWhack.com&amp;title=Check Out This cool new e-Store That sells you random Items" target="_blank"> <img class="image" src="https://simplesharebuttons.com/images/somacro/reddit.png" alt="Reddit" /> </a>
            
                <!-- Twitter -->
                <a class="navbar-brand" href="https://twitter.com/share?url=https://PattyWhack.com&amp;text=Look%20At%20this%20cool%20new%20Store!&amp;hashtags=PattyWhack" target="_blank"> <img class="image" src="https://simplesharebuttons.com/images/somacro/twitter.png" alt="Twitter" /> </a>
            
                <!-- Facebook -->
                <a class="navbar-brand" href="http://www.facebook.com/sharer.php?u=https://PattyWhack.com" target="_blank"> <img class="image" src="https://simplesharebuttons.com/images/somacro/facebook.png" alt="Facebook" /> </a>
            
    </ul>
     <ul class="nav navbar-nav navbar-right" style="margin-right: 20px;">
            <li><a href="/pattywhack/mvc/public/home/contact">Contact Us!</a></li>
            </ul>
</nav>