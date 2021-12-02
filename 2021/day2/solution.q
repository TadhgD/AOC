ex:flip`move`unit!("SH";" ")0:`:example
input:flip`move`unit!("SH";" ")0:`:input
f:{[t] t:update unit:neg unit from t where move=`up;exec sum unit from t where move=`forward;d:exec sum unit from t where move<>`forward;h*d}
g:{[t] h::0;d::0;a::0;fns:`forward`down`up!({h+::x;d+::a*x;};{a+::x;};{a-::x;});{fn[x`move]x`unit}each t;h*d}
