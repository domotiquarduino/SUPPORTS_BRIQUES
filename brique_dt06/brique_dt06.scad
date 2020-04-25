use <C:\Users\"VOTRE NOM UTILISATEUR"\Desktop\pieces_3D_openscad\brique_ajustable\bloc_brique.scad>
use <C:\Users\"VOTRE NOM UTILISATEUR"\Desktop\pieces_3D_openscad\PIECES_ELECTRONIQUES\pcb_dt06\pcb_dt06.scad>

hauteur_brique  = 1; // 1,2 ou 3

afficher_3x4           = "o"; //o,n 
afficher_socle         = "o"; //o,n 
afficher_support_haut  = "o"; //o,n 
afficher_pcb_dt06      = "o"; //o,n
afficher_dt06          = "o"; //o,n

if(afficher_pcb_dt06=="o") 
//translate([0,0,42]) 
rotate([0,0,360*$t]) 
//translate([0,0,-45*$t]) 
translate([0,0,2.8+0.8]) pcb_dt06();

if(afficher_dt06=="o") 
//translate([0,0,42]) 
rotate([0,0,360*$t]) 
//translate([0,0,-45*$t])        
translate([0,0,2.8+0.8]) dt06();

if(afficher_support_haut =="o") 
//translate([0,0,42]) 
rotate([0,0,360*$t]) 
//translate([0,0,-45*$t])        

translate([0,0,25-22.75]) support_haut();

module support_haut()
{  
  difference()
  {
   color("Cornsilk") translate([-0.0895,0,3+0.5+1.5-2.5/2])rotate([0,0,0])cube([19.1+0.35+2.65+0.25+1.48+1.3,10.7+0.35+2.65+0.25+2.5+4,7+2.5+2.5],center=true);       
   translate([0,0,3+1.2-2.5/2])rotate([0,0,0])cube([19.1+0.35+2.65+0.25+0.045+0.15,10.7+0.35+2.65+0.25+0.2+0.15,7+2.5+2.5],center=true); 
   translate([7.8-0.15,0,3+0.5+1.51+3])rotate([0,0,0])cube([4.1,10.7+0.35+1.2,7],center=true);
   translate([-7.8+0.15,0,3+0.5+1.51+3])rotate([0,0,0])cube([4.1,10.7+0.35+1.2,7],center=true);
         
   translate([-7.65+0.1,0,4.9-2.5/2])cube([4.1+0.3,10.7+0.35+4+2+0.5,6-1+0.1+5+2.5],center=true);       
  }
}

 union()
 {
  if(afficher_3x4 == "o") 
  //translate([0,0,42]) 
  rotate([0,0,360*$t]) 
  //translate([0,0,-45*$t])        
  translate([0,0,0]) brique3x4();



  if(afficher_socle == "o")
  {
  //translate([0,0,42]) 
         rotate([0,0,360*$t]) 
  //translate([0,0,-45*$t]) 
       difference()
       {
         color("Cornsilk") translate([0,0,3+0.5])rotate([0,0,0])cube([19.1+0.35+2.65,10.7+0.35+2.65,7],center=true); 
         translate([0,0,3+2-0.5])rotate([0,0,0])cube([19.1+0.35,10.7+0.35,6-1+0.1],center=true); 
            
         translate([-7.6,0,5.8])cube([3.8,10.7+0.35+4,6-1+0.1],center=true);  
       }
  }
 }

module brique3x4()
{  
  if(hauteur_brique==1)
  { 
   union()
   {    
    difference()
    {
    translate([-24+4+4+4,-20+4+4+0.1,-3.17]) rotate([0,0,0])
    bloc(3,3,hauteur_brique/3,axe_trou=false,trou_circulaire=false,renforcement=true,goujon_creux=false,surface_plate=false);
     translate([0,0,1.997])rotate([0,0,0])cube([32,26,4],center=true);                  
    }
   }
  } 
  if(hauteur_brique==2)
  { 
   union()
   {    
    difference()
    {
    translate([-24+4+4,-20+4+4+0.1,-3.17-3.17]) rotate([0,0,0])
    bloc(3,4,hauteur_brique/3,axe_trou=false,trou_circulaire=false,renforcement=true,goujon_creux=false,surface_plate=false);
     translate([0,0,1.994])rotate([0,0,0])cube([32,26,4],center=true);                 
    }
   }
  }
  if(hauteur_brique==3)
  { 
   union()
   {    
    difference()
    {
    translate([-24+4+4,-20+4+4+0.1,-3.17-3.17-3.17]) rotate([0,0,0])
    bloc(3,4,hauteur_brique/3,axe_trou=false,trou_circulaire=false,renforcement=true,goujon_creux=false,surface_plate=false);
     translate([0,0,1.991])rotate([0,0,0])cube([32,26,4],center=true);                   
    }
   }
  } 
}


