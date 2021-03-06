require 'graphics/bmp graphics/gl2'

coclass 'jviewmat'

coinsert 'jgl2 jni jaresu'
GUI=: IFQT +. IFJCDROID +. -. IFJHS +. IFIOS +. ('Android'-:UNAME)

jniImport ::0: (0 : 0)
android.content.Context
android.view.View
android.view.Window
)
MINWH=: <.@-:^:(IFIOS+.'Android'-:UNAME) 200 200
DEFWH=: <.@-:^:(IFIOS+.'Android'-:UNAME) 360 360

create=: 0:
destroy=: 3 : 0
codestroy''
)
finite=: x: ^: _1
intersect=: e. # [
citemize=: ,: ^: (2: > #@$)
rndint=: <.@:+&0.5
tomatrix=: (_2 {. 1 1 , $) $ ,
fitvm=: 4 : 0
'w h'=. x
mat=. y
'r c'=. $ mat
exp=. (- 0: , }:) <. 0.5 + +/\ r $ h % r
mat=. exp # mat
exp=. (- 0: , }:) <. 0.5 + +/\ c $ w % c
exp #"1 mat
)
delinf=: 3 : 0
if. +:/ _ __ e. ,y do. y return. end.
sc=. 0.1
a=. (,y) -. _ __
max=. >./a
min=. <./a
ext=. sc * max - min
(min-ext) >. y <. max+ext
)
getbmp=: 3 : 0
gid=. y, (0=#y) # GID
glsel gid
box=. 0 0,glqwh''
res=. glqpixels box
(3 2 { box) $ res
)
gethue=: 4 : 0
y=. y*<:#x
b=. x {~ <.y
t=. x {~ >.y
k=. y-<.y
(t*k) + b*-.k
)
getvm=: 4 : 0
'dat tit'=. 2 {. boxopen y
tit=. ": tit
tit=. tit, (0=#tit) # 'viewmat'
if. ifRGB do.
  mat=. dat
  ang=. ''
else.
  'mat ang'=. x getvm1 dat
end.
dat ; mat ; ang ; tit
)
getvm1=: 4 : 0
hue=. x
mat=. y
ang=. ''
if. 2 > #$hue do.
  hue=. |."1 [ 256 256 256 #: ,hue
end.
select. 3!:0 mat
case. 2;32 do.
  mat=. (, i. ]) mat
case. 16 do.
  ang=. * mat
  mat=. delinf | mat
case. do.
  mat=. finite mat
end.
select. #$mat
case. 0 do.
  mat=. 1 1$mat
case. 1 do.
  mat=. citemize mat
case. 3 do.
  'mat ang'=. mat
end.
if. */ (,mat) e. 0 1 do.
  if. #hue do.
    h=. <. 0 _1 { hue
  else.
    h=. 0 ,: 255 255 255
  end.
  mat=. mat { h

else.
  if. #hue do.
    h=. hue
  else.
    h=. 255 * #: 7 | 3^i.6
  end.
  val=. ,mat
  max=. >./ val
  min=. <./ val
  mat=. <. h gethue (mat - min) % max - min
end.

mat=. mat +/ .* 65536 256 1

mat ; ang

)
hadd=: 3 : 0
setvmh VMH,~coname''
)
hcascade=: 3 : 0
''
)
hforms=: 3 : 0
fms=. <;._2 &> <;._2 wdqpx''
fms=. fms #~ (1{"1 fms) e. VMH
fms \: 0 ". &> 4{"1 fms
)
hremove=: 3 : 0
setvmh VMH -. coname''
)
setvmh=: 3 : 0
VMH_jviewmat_=: (~.y) intersect conl 1
)
rgb1=: 256&(#. flipwritergb_jbmp_)
no_gui_bmp=: 3 : 0
mat=. finite MAT
'rws cls'=. $mat
mwh=. cls,rws
if. -. ifRGB do.
  mwh=. MINWH >. <. mwh * <./ DEFWH % cls,rws
end.
mat=. mwh fitvm mat
)
vmcc=: 4 : 0
ifRGB=: x -: 'rgb'
'mat gid'=. y
'DAT MAT ANG TITLE'=: x getvm mat
mat=. finite MAT
'rws cls'=. $mat
glsel gid
mwh=. glqwh''
if. #ANG do. mwh vf_show mat return. end.
mat=. , mwh fitvm mat
glpixels (0 0, mwh), mat (27 b.) 16bffffff
)
viewmat_g_paint=: 3 : 0
mat=. finite MAT
'rws cls'=. $mat
gwh=. glqwh''
if. ifRGB > SHOW do.
  glbrush glrgb 0 0 0
  glrect 0 0,gwh
  mwh=. cls,rws
else.
  mwh=. gwh
end.
if. #ANG do. mwh vf_show mat return. end.
mat=. , mwh fitvm mat
glpixels (0 0, mwh), alpha27 mat
SHOW=: 1
EMPTY
)
viewmat_close=: 3 : 0
hremove''
wd 'pclose'
destroy''
1
)
viewmat_focus_in=: hadd
viewmat_key_press=: 3 : 0
if. isesckey y do. viewmat_close'' else. 0 end.
)
window_delete=: viewmat_close
fitvf=: 4 : 0

hw=. |. x

'h w'=. hw

mat=. y
'r c'=. s=. $ mat

mat=. ({."1 mat),.mat,.{:"1 mat
mat=. ({.mat),mat,{:mat

mat=. 256 256 256 #: mat

'r2 c2'=. s + 2
'h2 w2'=. <. hw * (r2,c2) % r,c

x=. (c2-1) * (i.w2+1) % w2
k=. x - <. x
b=. (<.x) {"2 mat
t=. (>.x) {"2 mat
mat=. (t *"2 k) + b *"2 -.k

x=. (r2-1) * (i.h2+1) % h2
k=. x - <. x
b=. (<.x) { mat
t=. (>.x) { mat
mat=. (t * k) + b * -.k
mat=. 256 #. >. mat

'xr xc'=. <. -: ($mat) - hw
hw {. xc }."1 xr }. mat
)
vf_show=: 4 : 0

mwh=. x
mat=. y
'rws cls'=. $mat
mat=. , mwh fitvf mat

glrgb 0 0 0
glpen 1 0
glbrush''

glpixels (0 0, mwh), alpha27 mat
len=. <. <./ 'scls srws'=. mwh % cls,rws
x=. (-:scls) + scls * i. cls
y=. (-:srws) + srws * i. rws
mid=. x j."1 0 y

if. len < 3 do.
elseif. len e. 3 4 do.
  pixel=. _1 + i.len
  glpixel _2 [\ , rndint +."1 mid + + ANG */ pixel
elseif. len < 20 do.
  ext=. -: len * 0.75
  lines=. ext ,. (-ext), ext - ext * 0.7 * 1j0.8
  gllines _4 [\ , rndint +."1 mid + + ANG */ lines
elseif. do.
  ext=. -: len * 0.75
  lines=. ext , -ext
  gllines _4 [\ , rndint +."1 mid + + ANG */ lines
  poly=. ext - 0,(10 <. len*0.2) * 1j0.6,0.6,1j_0.6
  glpolygon _8 [\ , rndint +."1 mid + + ANG */ poly
end.

)
closeall=: 3 : 0
for_loc. setvmh VMH do.
  viewmat_close__loc''
end.
)
getsize=: 3 : 0
fms=. hforms''
if. 0=#fms
do. mbinfo 'viewmat';'No viewmat forms.' return.
end.
wd 'psel ',(<0 1) pick fms
_2 {. wdqchildxywh GID
)
readmat=: 3 : 0
fms=. hforms''
if. 0=#fms do.
  mbinfo 'viewmat';'No viewmat forms.' return.
end.
wd 'psel ',(<0 1) pick fms
getbmp''
)
savemat=: 3 : 0
fl=. y
if. 0 = #fl do.
  fl=. jpath '~temp/viewmat.bmp'
end.
fms=. hforms''
if. 0=#fms
do. mbinfo 'viewmat';'No viewmat forms.' return.
end.
wd 'psel ',(<0 1) pick fms
(getbmp'') writebmp fl
)
setsize=: 3 : 0
if. IFQT do. return. end.
fms=. hforms''
if. 0=#fms
do. mbinfo 'viewmat';'No viewmat forms.' return.
end.
loc=. (<0 2) { fms
wd 'psel ',(<0 1) pick fms
form=. wdqform''
xywh=. wdqchildxywh GID
dif=. 0 0, y - _2 {. xywh
wd 'pmove ',":form + dif
)
viewbmp=: 3 : 0
'' viewbmp y
:
dat=. readbmp y
if. 2 = 3!:0 dat do. return. end.
'rgb' viewmat dat;x
)
viewmat=: 3 : 0
'' viewmat y
:
a=. '' conew 'jviewmat'
xx__a=: x [ yy__a=: y
if. GUI do.
  if. IFJCDROID do.
    0 StartActivity_ja_ (>a); 'onDestroy'
  else.
    empty vmrun__a ''
  end.
else.
  empty vmrun__a ''
  (no_gui_bmp__a'') writebmp jpath '~temp/viewmat.bmp'
  if. (UNAME-:'Android') *. 0=isatty 0 do.
    android_exec_host 'android.intent.action.VIEW';('file://',jpath '~temp/viewmat.bmp');'image/bitmap'
  end.
  destroy__a ''
end.
)
viewmatcc=: 3 : 0
'' viewmatcc y
:
empty x vmcc y
)
vmrun=: 3 : 0
x=. xx [ y=. yy
if. 0 > nc <'VMH' do. setvmh '' end.
SHOW=: 0
ifRGB=: x -: 'rgb'
'DAT MAT ANG TITLE'=: x getvm y
mat=. finite MAT
'rws cls'=. $mat
mwh=. cls,rws
if. -. ifRGB do.
  mwh=. MINWH >. <. mwh * <./ DEFWH % cls,rws
end.
mwh0=: mwh
vmwin^:GUI mwh
hcascade''
hadd''
)
vmwin=: 3 : 0
if. IFQT do.
  wd 'pc viewmat;pn *',TITLE
  wd 'minwh ', ":mwh0
  wd 'cc g isigraph flush'
  wd 'pshow'
end.
)
isigraph_event=: 4 : 0
evt=. >@{.y
syshandler=. 'viewmat_handler'
sysevent=. 'viewmat_g_', evt
sysdefault=. 'viewmat_default'
wdd=. ;: 'syshandler sysevent sysdefault'
wdqdata=. (wdd ,. ".&.>wdd)
evthandler wdqdata
0
)
Activity=: 0

onCreate=: 3 : 0
jniCheck Activity=: NewGlobalRef <2{y
jniCheck Activity ('requestWindowFeature (I)Z' jniMethod)~ FEATURE_NO_TITLE
jniCheck win=. Activity ('getWindow ()LWindow;' jniMethod)~ ''
jniCheck win ('setFlags (II)V' jniMethod)~ FLAG_FULLSCREEN;FLAG_FULLSCREEN
jniCheck DeleteLocalRef <win
option=. 0
vmrun''
wh=. mwh0
idnx=: (0,Activity) glcanvas_jgl2_ wh ; coname''
l=. glgetloc_jgl2_ idnx
thisview=. view__l
jniCheck Activity ('setContentView (LView;)V' jniMethod)~ thisview
jniCheck thisview ('requestFocus ()Z' jniMethod)~ ''
jniCheck DeleteLocalRef <thisview

0
)

onDestroy=: 3 : 0
if. Activity do.
  jniCheck DeleteGlobalRef <Activity
end.
Activity=: idnx=: 0
0
)
viewmat_z_=: viewmat_jviewmat_
viewbmp_z_=: viewbmp_jviewmat_
viewrgb_z_=: 'rgb' & viewmat_jviewmat_
rgb1_z_=: rgb1_jviewmat_
