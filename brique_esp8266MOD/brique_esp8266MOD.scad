use <C:\Users\"VOTRE NOM UTILISATEUR"\Desktop\pieces_3D_openscad\brique_ajustable\bloc_brique.scad>
use <C:\Users\"VOTRE NOM UTILISATEUR"\Desktop\pieces_3D_openscad\PIECES_ELECTRONIQUES\esp12\esp12.scad>

//___________________________________VARIABLES___________________________________
coin_arrondi            ="o";
hauteur_brique          =1;   // 1,2 ou 3
afficher_brique         ="o"; // "o" ou "n"
afficher_socle          ="o"; // "o" ou "n"
afficher_boitier        ="o"; // "o" ou "n"
hauteur_boitier         =2;   // 1 ou 2
afficher_fixation       ="o"; // "o" ou "n"
rotation_360            ="o";
mouvement_hauteur       ="n";

// (hauteur 1) z=3.167
// (hauteur 2) z=6.334
// (hauteur 3) z=9.501

  x=39.82;
  y=39.82;
  z=6.00;
  //z=3.167*1;  // hauteur brique officielle
//cube([x,y,z]);
//___________________________________ANIMATIONS__________________________________
//Mettre :      FPS : 50  -----------    Etapes : 50    -----------
if(rotation_360=="o" && mouvement_hauteur=="o")translate([0,0,42]) rotate([0,0,360*$t]) translate([0,0,-45*$t]) translate([0,0,2.2]) rotate([0,0,-90]) suppportEtEsp12E();
if(rotation_360 =="n" &&mouvement_hauteur=="o")translate([0,0,-45*$t]) translate([0,0,2.2]) rotate([0,0,-90]) suppportEtEsp12E();
if(rotation_360=="o" && mouvement_hauteur=="n")translate([0,0,1.85]) rotate([0,0,-90]) rotate([0,0,360*$t]) suppportEtEsp12E();
if(rotation_360=="n" && mouvement_hauteur=="n") rotate([0,0,-90]) suppportEtEsp12E();  
//___________________________________CONDITIONS__________________________________


if(rotation_360=="o") if(afficher_socle=="o") rotate ([0,0,360*$t]) socle();
if(rotation_360=="o") if(afficher_brique=="o") rotate ([0,0,360*$t]) brique();
if(afficher_boitier=="o") 
{ 
  if(hauteur_boitier==1)     
  if(rotation_360=="o") translate ([0.00,0.00,6.78])rotate ([0,0,360*$t]) rotate([0.00,180,180]) boitier();
  if(hauteur_boitier==2)     
  if(rotation_360=="o") translate ([0.00,0.00,38.75]) rotate ([0,0,360*$t]) rotate([0.00,180,180]) boitier();  
}      
if(hauteur_brique==1) 
{    
  if(rotation_360=="o") 
  {
      if(afficher_fixation=="n") 
      {
       rotate ([0,0,360*$t]) translate([0,0,-42.9]) translate ([0,0,45*$t]) fixation();
      }
      else
      {
       rotate ([0,0,360*$t]) fixation();   
      }
  }
}
if(hauteur_brique==2) if(rotation_360=="o") if(afficher_fixation=="n") rotate ([0,0,360*$t]) translate([0,0,-49.9]) translate ([0,0,45*$t]) fixation();
if(hauteur_brique==3) if(rotation_360=="o") if(afficher_fixation=="n") rotate ([0,0,360*$t]) translate([0,0,-55.9]) translate ([0,0,45*$t]) fixation();
//___________________________________MODULES____________________________________
module socle()
{
	difference()
        {
          //contour socle
        if(coin_arrondi=="o"){translate([-x/2,-y/2,z/2]) color("Cornsilk") cube_arrondi(x,y,z,0.12);}
        else{translate ([0,0,z/2]) color("Cornsilk") cube([x,y,z],center=true );}
          //trou intérieur socle x=31.00, y=28.00
          translate ([0,0,z/2+2.2]) cube([31+0.45,28+0.45,0+z+3.8],center=true); 
        }
        translate([0,y/2-5.2,z-(1.45/2)])color("Cornsilk")cube([13.1,5.2,1.45],center=true);
}


module cube_arrondi(xdim,ydim,zdim,rdim)
{
       $fn=64;
 hull()
 {
  translate([rdim,rdim,-zdim/2]) cylinder(r=rdim, h=zdim);
  translate([xdim-rdim,rdim,-zdim/2]) cylinder(r=rdim, h=zdim);    
  translate([rdim,ydim-rdim,-zdim/2]) cylinder(r=rdim, h=zdim);
  translate([xdim-rdim,ydim-rdim,-zdim/2]) cylinder(r=rdim, h=zdim);         
 }      
       
}

//(bloc 1)  x ou y = 7.82 
//(bloc 2)  x ou y = 15.82 
//(bloc 3)  x ou y = 23.82
//(bloc 4)  x ou y = 31.82 
//(bloc 5)  x ou y = 39.82
//(bloc 6)  x ou y = 47.82
//(bloc 7)  x ou y = 55.82 
//(bloc 8)  x ou y = 63.82 
//(bloc 9)  x ou y = 71.82
//(bloc 10) x ou y = 79.82
//(bloc 11) x ou y = 87,82
//(bloc 12) x ou y = 95,82
//(bloc 13) x ou y = 103,82
//(bloc 14) x ou y = 111,82
//(bloc 15) x ou y = 119,82
//(bloc 16) x ou y = 127,82
//(bloc 17) x ou y = 135,82
//(bloc 18) x ou y = 143,82

module boitier()
{  
          difference()
          {       
           //contour boitier
           color("Cornsilk") translate([0.00,0.00,-2.00-1]) cube([x,y,0+z+1.50],center=true);
           translate([0.00,0.00,-1.7]) cube([x-8.62-0.26-5,y-7.92-0.26-5,0+z+2.60],center=true);     
           translate([-14.3+0.06,3.70,-3]) cube([2.9,21.3,0+z+2.60],center=true);  
           translate([14.3-0.06,3.70,-3]) cube([2.9,21.3,0+z+2.60],center=true);     
          }
          difference()
          {
          //trou intérieur boitier
          color("Cornsilk") translate([0.00,0.00,-0.40]) cube([x-8.62,y-7.92-0.26-3.35,z-1.3],center=true); 
          translate([0.00,0.00,-1.7]) cube([x-8.62-0.26-5,y-7.92-0.26-5,0+z+1.60],center=true);      translate([0.00,-14.50,2.501]) cube([18,4,3.5],center=true);
          translate([14.00,3.2,2.501]) cube([4,25.5,3.5],center=true); 
          translate([-14.00,3.2,2.501]) cube([4,25.5,3.5],center=true);
        
           translate([-14.3+0.06,3.70,-3]) cube([2.9,21.3,0+z+2.60],center=true); 
           translate([14.3-0.06,3.70,-3]) cube([2.9,21.3,0+z+2.60],center=true);     
          }
                   
          color("Cornsilk") translate([12.00,0.00,-2.00-1-0.01]) cube([x/20,y-7.3,0+z+1.50-0.0185],center=true);
          color("Cornsilk") translate([-12.00,0.00,-2.00-1-0.01]) cube([x/20,y-7.3,0+z+1.50-0.0185],center=true);
       
} 

module brique()
{  
  if(hauteur_brique==1)
  { 
   union()
   {       
     translate([-x/2,-y/2,-3.163]) bloc_ajustable();                             
   }
  } 
  if(hauteur_brique==2)
  { 
   union()
   {    
    translate([-x/2,-y/2,-3.17*2+0.01]) bloc_ajustable();                  
   }
  }
  if(hauteur_brique==3)
  { 
   union()
   {    
    translate([-x/2,-y/2,-3.17*3+0.01]) bloc_ajustable();                   
   }
  } 
}


module bloc_ajustable()
{
    if(y==39.82 && x==39.82) color("Cornsilk") bloc5x5();              
}


module bloc5x5()
{
  bloc(5,5,hauteur_brique/3,axe_trou=false,trou_circulaire=false,renforcement=true,goujon_creux=false,surface_plate=true);     
}



module bloc2x2()
{
  color("Cornsilk") bloc(2,2,hauteur_brique/3,axe_trou=false,trou_circulaire=false,renforcement=true,goujon_creux=false,surface_plate=false);     
}


module fixation()
{
 translate ([4.090,4.09,-6.329]) bloc2x2();
 translate ([-19.91,4.09,-6.329]) bloc2x2();
 translate ([-19.91,-19.91,-6.329]) bloc2x2();
 translate ([4.090,-19.91,-6.329]) bloc2x2();
}




