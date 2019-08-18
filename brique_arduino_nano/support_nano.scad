//Support brique à imbriquer pour Arduino Nano
use <C:\Users\"VOTRE NOM UTILISATEUR"\Desktop\pieces_3D_openscad\brique_ajustable\bloc_brique.scad>
use <C:\Users\"VOTRE NOM UTILISATEUR"\Desktop\pieces_3D_openscad\PIECES_ELECTRONIQUES\nano\nano.scad>

//__________________________VARIABLES_________________________________________
hauteur_brique       =1;  //1,2 ou 3
afficher_socle       ="o"; //o,n 
coin_arrondi         ="o"; //o,n
afficher_6x4         ="o"; //o,n 

afficher_support_bas ="o"; //o,n
mouvement_supp_bas   ="n"; //o,n
rota_360_support_bas ="z"; //z,n

afficher_fixation    ="o"; //o,n
mouvement_fixation   ="n"; //o,n
rota_360_fixation    ="z"; //z,n

afficher_nano        ="o"; //o,n
mouv_hauteur_nano    ="n"; //o,n
rotation_360_nano    ="z"; //z,n

xext = 26.73;
yext = 47.82;
zext = 6.00;

xint = xext-8.40;
yint = yext-4.35;
zint = zext;

//valeurs pour brique du socle
x=31.82;
y=47.82;

//__________________________CONDITIONS/MOUVEMENTS____________________________
if(afficher_nano=="o") 
{ 
  if(mouv_hauteur_nano=="n" && rotation_360_nano=="z")  
  rotate([0,0,360*$t]) translate([0,0,6.5]) rotate([180,0,-90]) nano_328_v2();
  else if (mouv_hauteur_nano=="o" && rotation_360_nano=="z")
  translate([0,0,50]) translate([0,0,-50.3*$t]) rotate([0,0,360*$t]) translate([0,0,6.5]) rotate([180,0,-90]) nano_328_v2();
  else if (mouv_hauteur_nano=="o" && rotation_360_nano=="n")
  translate([0,0,50]) translate([0,0,-50.3*$t]) translate([0,0,6.5]) rotate([180,0,-90]) nano_328_v2();
  else  
  translate([0,0,6.5]) rotate([180,0,-90]) nano_328_v2();
}

 if(afficher_fixation=="o") 
 { 
  if(mouvement_fixation=="n" && rota_360_fixation=="z")  
  rotate([0,0,360*$t]) fixation();
  else if (mouvement_fixation=="o" && rota_360_fixation=="z")
  translate([0,0,-50]) translate([0,0,50.3*$t]) rotate([0,0,360*$t]) fixation();
  else if (mouvement_fixation=="o" && rota_360_fixation=="n")
  translate([0,0,-50]) translate([0,0,50.3*$t]) fixation();
  else  
  fixation();
}    

 if(afficher_support_bas=="o") 
 {
  if(mouvement_supp_bas=="n" && rota_360_support_bas=="z")  
  rotate([0,0,360*$t]) support_bas();
  else if (mouvement_supp_bas=="o" && rota_360_support_bas=="z")
  translate([0,0,50]) translate([0,0,-50.3*$t]) rotate([0,0,360*$t]) support_bas();
  else if (mouvement_supp_bas=="o" && rota_360_support_bas=="n")
  translate([0,0,50]) translate([0,0,-50.3*$t]) support_bas();
  else  
  support_bas();
 }

module support_bas()
{
union()
{
 if(afficher_6x4=="o") brique();

 if(afficher_socle=="o")
 {     
  difference()
  {
    //contour cube extérieur socle
   if(coin_arrondi=="o"){color("Cornsilk") translate([-xext/2,-yext/2,zext]) cube_arrondi(xext,yext,zext,2.22);}
   else{color("Cornsilk") translate([0,0,3])rotate([0,0,0])cube([xext,yext,zext],center=true);}    
   //trou intérieur   
   translate([0,0,3+2])rotate([0,0,0])cube([xint,yint,zint],center=true);
   //trou sortie avant
   translate([0,-23,3+2])rotate([0,0,0])cube([10,5,3.7],center=true);
  }
 }
}
}

module brique()
{  
  if(hauteur_brique==1)
  {     
    color("Cornsilk") translate([-x/2,-y/2,-3.163]) bloc_ajustable();            
  } 
  if(hauteur_brique==2)
  {    
    color("Cornsilk") translate([-x/2,-y/2,-3.17*2+0.01]) bloc_ajustable(); 
  }
  if(hauteur_brique==3)
  {    
    color("Cornsilk") translate([-x/2,-y/2,-3.17*3+0.01]) bloc_ajustable(); 
  } 
}

//__________________________MODULES_________________________________________
module cube_arrondi(xdim,ydim,zdim,rdim)
{
 $fn=64;
 hull()
 {
  translate([rdim,rdim,-zdim/2]) cylinder(r=rdim, h=zdim, center=true);
  translate([xdim-rdim,rdim,-zdim/2]) cylinder(r=rdim, h=zdim , center=true);    
  translate([rdim,ydim-rdim,-zdim/2]) cylinder(r=rdim, h=zdim, center=true);
  translate([xdim-rdim,ydim-rdim,-zdim/2]) cylinder(r=rdim, h=zdim, center=true);         
 }      
       
}

module bloc_ajustable()
{
    if(y==47.82 && x==31.82) bloc6x4();              
}


module bloc6x4()
{
  bloc(6,4,hauteur_brique/3,axe_trou=false,trou_circulaire=false,renforcement=true,goujon_creux=false,surface_plate=true);     
}

module fixation()
{
 color("Cornsilk") translate ([-15.91,8.09,-6.329]) bloc4x2();
 color("Cornsilk") translate ([-15.91,-23.91,-6.329]) bloc4x2();
}


module bloc4x2()
{
  bloc(2,4,hauteur_brique/3,axe_trou=false,trou_circulaire=false,renforcement=true,goujon_creux=false,surface_plate=false);     
}

