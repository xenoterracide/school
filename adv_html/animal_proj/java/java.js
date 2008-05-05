function switch1(div) {
if (document.getElementById('one')) {
var option=['one','two'];
for(var i=0; i<option.length; i++)
{ obj=document.getElementById(option[i]);
obj.style.display=(option[i]==div)? "block" : "none"; }
}
}
//
function switchImg(i){
document.images["image"].src = i;
}