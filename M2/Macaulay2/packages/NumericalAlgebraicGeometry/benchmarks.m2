loadPackage "ExampleIdeals"

linearExample = () -> (
     R := CC[x,y]; 
     ideal {x+y-3,x-y-1}
     )

tinyExample = () -> (
     R := CC[x,y];
     S := {x^2-1,y-1};
     T := {x^2+y^2-1, x};
     solsS := {(1,1),(-1,1)};
     (S,T,solsS)
     )

smallExample = () -> (
     R := CC[x,y];
     S := {x^2-1,y^2-1};
     T := {x^2+y^2-1, x*y};
     solsS := {(1,-1),(1,1),(-1,1),(-1,-1)};
     (S,T,solsS)
     )

smallInfinityExample = () -> (
     R := CC[x,y];
     S := {x^2-1,y^2-1};
     T := {x^2+y^2-1, x-y};
     solsS := {(1,-1),(1,1),(-1,1),(-1,-1)};
     (S,T,solsS)
     )

example2 = () -> (
     R := CC[s1,s2,g1,g2,C1,C2];
     ideal(
	  s1^2+g1^2 - 1,
	  s2^2+g2^2 - 1,
	  C1*g1^3+C2*g2^3 - 1.2,
	  s1+s2-1,
	  g1+g2-2,
	  C1+C2-3)
)

example1 = () -> (
     R := CC[s1,s2,g1,g2,C1,C2];
     ideal( -- bertini is slow on this
  	  s1^2+g1^2 - 1, 
  	  s2^2+g2^2 - 1,
  	  C1*g1^3+C2*g2^3 - 1.2,
  	  C1*s1^3+C2*s2^3 - 1.2,
  	  C1*g1^2*s1+C2*g2^2*s2 - 0.7,
  	  C1*g1*s1^2+C2*g2*s2^2 - 0.7)
     )
      
stewartGough40real = () -> (
     R := CC[n1,n2,n3,h11,h12,h13,h21,h22,h23];
ideal { n1^2 + n2^2 + n3^2 - 1,
 h11^2 + h12^2 + h13^2 - 1,
 h21^2 + h22^2 + h23^2 - 1,
 h11*h21 + h12*h22 + h13*h23,
 n1^2 + 1.085610*n1*h11 - 2.215830*n1 + 0.2946372680*h11^2 - 1.202763603*h11
 + 0.8110958214+n2^2 + 1.085610*n2*h12 + 0.2946372680*h12^2 + n3^2
 + 1.085610*n3*h13 + 0.2946372680*h13^2,
 - 1.050876963*h11 - 1.446982100*h12 + 0.5808481060*h21 + 0.7997861232*h22
 - 1.098188*n1 - 1.512126*n2 - 1.012257626*h12*h22 + 0.9156939726*h11^2
 + 0.9156939726*h12^2 + 0.2797510772*h23^2 + 0.9156939726*h13^2 + n2^2 + n3^2
 - 1.012257626*h11*h21 + n1^2 - 1.012257626*h13*h23 + 0.2797510772*h22^2
 + 0.2797510772*h21^2 - 1.057830*n3*h23 - 0.3068774482 + 1.913838*n1*h11
 + 1.913838*n2*h12 + 1.913838*n3*h13 - 1.057830*n1*h21 - 1.057830*n2*h22,
 2.805076*n1*h12*h23 - 0.9789534962*h11 + 0.2982299150*h12 - 0.7004990340*h13
 + 0.5196729762*h21 - 0.1583139833*h22 + 0.3718567014*h23 - 1.470154*n1
 + 0.447870*n2 - 1.051982*n3 + 2.805076*n3*h11*h22 - 0.4707567232*h12*h22
 - 2.061946850*h12*h23 - 0.6281546940*h11*h23 - 1.475444730*h11*h22
 + 1.475444730*h12*h21 - 2.805076*n1*h13*h22 + 2.805076*n2*h13*h21
 - 2.805076*n2*h11*h23 + 0.4434028332*h11^2 + 0.4434028332*h12^2
 + 0.1249495243*h23^2 + 0.4434028332*h13^2 + 0.6281546940*h13*h21
 + 2.061946850*h13*h22 + n2^2 + n3^2 - 2.805076*n3*h12*h21
 - 0.4707567232*h11*h21 + n1^2 - 0.4707567232*h13*h23 - 1.393177215
 + 0.1249495243*h22^2 + 0.1249495243*h21^2 - 3.934225682*h11*h22*h12*h21
 + 1.967112841*h11^2*h22^2 + 1.967112841*h12^2*h21^2 - 0.706964*n3*h23
 + 1.967112841*h12^2*h23^2 + 1.967112841*h13^2*h22^2 + 1.331770*n1*h11
 + 1.331770*n2*h12 + 1.331770*n3*h13 - 3.934225682*h12*h23*h13*h22
 + 1.967112841*h13^2*h21^2 + 1.967112841*h11^2*h23^2
 - 3.934225682*h13*h21*h11*h23 - 0.706964*n1*h21 - 0.706964*n2*h22,
 0.215344*n1*h12*h23 - 0.4919329150*h11 + 0.5032939412*h12 + 0.3524721322*h13
 - 1.191622463*h21 + 1.219142585*h22 + 0.8538028204*h23 - 1.028376*n1
 + 1.052126*n2 + 0.736836*n3 + 0.215344*n3*h11*h22 + 1.108589329*h12*h22
 - 0.1107273007*h12*h23 - 0.1132845107*h11*h23 + 0.7933660580e-1*h11*h22
 - 0.7933660580e-1*h12*h21 - 0.215344*n1*h13*h22 + 0.215344*n2*h13*h21
 - 0.215344*n2*h11*h23 + 0.2288273329*h11^2 + 0.2288273329*h12^2
 + 1.342683023*h23^2 + 0.2288273329*h13^2 + 0.1132845107*h13*h21
 + 0.1107273007*h13*h22 + n2^2 + n3^2 - 0.215344*n3*h12*h21
 + 1.108589329*h11*h21 + n1^2 + 1.108589329*h13*h23 + 1.342683023*h22^2
 + 1.342683023*h21^2 - 0.2318651916e-1*h11*h22*h12*h21
 + 0.1159325958e-1*h11^2*h22^2 + 0.1159325958e-1*h12^2*h21^2
 + 2.317484*n3*h23 + 0.1159325958e-1*h12^2*h23^2 + 0.1159325958e-1*h13^2*h22^2
 + 0.956718*n1*h11 + 0.956718*n2*h12 + 0.956718*n3*h13
 - 0.2318651916e-1*h12*h23*h13*h22 + 0.1159325958e-1*h13^2*h21^2
 + 0.1159325958e-1*h11^2*h23^2 - 0.2318651916e-1*h13*h21*h11*h23
 + 2.317484*n1*h21 + 2.317484*n2*h22 - 0.9664888140,
 0.707826*n1*h12*h23 + 0.1618923443*h11 + 0.2597332554e-1*h12
 - 0.5621060514e-1*h13 + 0.2776652044*h21 + 0.4454743538e-1*h22
 - 0.9640807436e-1*h23 - 1.180946*n1 - 0.189466*n2 + 0.410036*n3
 + 0.707826*n3*h11*h22 + 0.6446406506e-1*h12*h22 - 0.4179521416*h12*h23
 + 0.6705448046e-1*h11*h23 + 0.1451170709*h11*h22 - 0.1451170709*h12*h21
 - 0.707826*n1*h13*h22 + 0.707826*n2*h13*h21 - 0.707826*n2*h11*h23
 + 0.1879284557e-1*h11^2 + 0.1879284557e-1*h12^2 + 0.5528188464e-1*h23^2
 + 0.1879284557e-1*h13^2 - 0.6705448046e-1*h13*h21 + 0.4179521416*h13*h22
 + n2^2 + n3^2 - 0.707826*n3*h12*h21 + 0.6446406506e-1*h11*h21 + n1^2
 + 0.6446406506e-1*h13*h23 + 0.5528188464e-1*h22^2 + 0.5528188464e-1*h21^2
 - 0.2505088232*h11*h22*h12*h21 + 0.1252544116*h11^2*h22^2
 + 0.1252544116*h12^2*h21^2 - 0.470242*n3*h23 + 0.1252544116*h12^2*h23^2
 + 0.1252544116*h13^2*h22^2 - 0.274174*n1*h11 - 0.274174*n2*h12
 - 0.274174*n3*h13 - 0.2505088232*h12*h23*h13*h22 + 0.1252544116*h13^2*h21^2
 + 0.1252544116*h11^2*h23^2 - 0.2505088232*h13*h21*h11*h23 - 0.470242*n1*h21
 - 0.470242*n2*h22 - 0.1948854017 }
)

randomNFactorialSystem = (n,kk) -> (
     R = kk[vars(53..n+51)];
     ideal apply(n-1, d-> sum(n-1, i -> random(-100,100)*R_i^(d+2)) - 100)
     )

randomQuadraticSystem = (n,kk) -> (
     R := kk[vars(53..n+52)];
     ideal apply(n, i->random(2,R) - 1)
     )

randomSystem = (n,d,kk) -> (
     R := kk[vars(53..n+52)]; 
     ideal apply(n, i->sum(toList(1..d),j->random(j,R)) - 1)
     )

cyclic = (n,kk) -> (
     R := kk[vars(53..n+52)];
     ideal apply(1..n-1, d-> sum(0..n-1, i -> product(d, k -> R_((i+k)%n)))) 
       + ideal(product gens R - 1))

cyclicH = (n,kk) -> (
     R := kk[vars(53..n+53)];
     ideal apply(1..n-1, d-> sum(0..n-1, i -> product(d, k -> R_((i+k)%n)))) 
       + ideal(product(n, i -> R_i) - R_n^n))

katsuraBench = n -> (
     R := CC[vars(53..n+52)];
     I := katsura(n,CC);
     (map(R,ring I, vars R)) I
     )

randomGeneralizedEigenvalueProblem = n -> (
     R := CC[symbol lambda, vars(53..n+52)];
     A := sub(random(CC^n,CC^n), R);
     B := sub(random(CC^n,CC^n), R);
     x := transpose matrix{drop(gens R,1)};
     T := flatten entries (A*x-R_0*B*x) | {n - 1 - sum flatten entries x};
     S := apply(n,i->(R_0-exp(ii*i/(2*pi*n)))*(x_(i,0)-1)) | {n - 1 - sum flatten entries x};
     solsS := apply(n,i->toSequence({exp(ii*i/(2*pi*n))} | toList(i:1) | {0} | toList(n-i-1:1)));
     (T,S,solsS)
     )

sottileW = () -> (
     R=QQ[x1,x2,x3,x4,x5,x6,x7,x8];
     I = trim ideal( 
	  -539445/16*x2*x5-117675/16*x3*x5-3795/8*x4*x5+539445/16*x1*x6-12945/16*x3*x6-555/8*x4*x6+117675/16*x1*x7+12945/16*x2*x7-15/4*x4*x7+3795/8*x1*x8+555/8*x2*x8+15/4*x3*x8-1357665/4*x1-1205205/8*x2-197745/8*x3-5685/4*x4+596925*x5+398475/2*x6+58275/2*x7+1575*x8+661500,
	  -93925/41472*x2*x5-19705/20736*x3*x5-205/1728*x4*x5+93925/41472*x1*x6-8305/41472*x3*x6-115/3456*x4*x6+19705/20736*x1*x7+8305/41472*x2*x7-1/288*x4*x7+205/1728*x1*x8+115/3456*x2*x8+1/288*x3*x8-29005/4608*x1-18415/3456*x2-23213/13824*x3-215/1152*x4+1505/256*x5+1435/384*x6+805/768*x7+7/64*x8+441/128,
	  -43043803578009/413220935680000*x2*x5-1193518511991/8433080320000*x3*x5-10652778279/210827008000*x4*x5+43043803578009/413220935680000*x1*x6-866311318431/8433080320000*x3*x6-204464871/4302592000*x4*x6+1193518511991/8433080320000*x1*x7+866311318431/8433080320000*x2*x7-1584999/107564800*x4*x7+10652778279/210827008000*x1*x8+204464871/4302592000*x2*x8+1584999/107564800*x3*x8-1757763891/84330803200*x1-527058132471/8264418713600*x2-11147297967/168661606400*x3-90344943/4216540160*x4+90344943/20661046784*x5+10652778279/1033052339200*x6+204464871/21082700800*x7+1584999/527067520*x8+1584999/2582630848,
	  13421/82944000000000*x2*x5+4597/4147200000000*x3*x5+77/34560000000*x4*x5-13421/82944000000000*x1*x6+3193/829440000000*x3*x6+71/6912000000*x4*x6-4597/4147200000000*x1*x7-3193/829440000000*x2*x7+1/57600000*x4*x7-77/34560000000*x1*x8-71/6912000000*x2*x8-1/57600000*x3*x8+533/331776000000000*x1+313/13824000000000*x2+1939/16588800000000*x3+29/138240000000*x4-29/331776000000000*x5-77/82944000000000*x6-71/16588800000000*x7-1/138240000000*x8-1/331776000000000,
	  26089/104485552128000*x2*x5-613753/435356467200000*x3*x5+2849/1209323520000*x4*x5-26089/104485552128000*x1*x6+291403/72559411200000*x3*x6-1799/201553920000*x4*x6+613753/435356467200000*x1*x7-291403/72559411200000*x2*x7+7/559872000*x4*x7-2849/1209323520000*x1*x8+1799/201553920000*x2*x8-7/559872000*x3*x8+217/58047528960000*x1-22463/522427760640000*x2+79513/435356467200000*x3-329/1209323520000*x4+329/1306069401600000*x5-2849/1306069401600000*x6+1799/217678233600000*x7-7/604661760000*x8-7/653034700800000,
	  -122949761/7782481350000*x2*x5+4941739/222356610000*x3*x5-9823/1058841000*x4*x5+122949761/7782481350000*x1*x6-2499761/158826150000*x3*x6+6611/756315000*x4*x6-4941739/222356610000*x1*x7+2499761/158826150000*x2*x7-11/3601500*x4*x7+9823/1058841000*x1*x8-6611/756315000*x2*x8+11/3601500*x3*x8-277783/72060012500*x1+2853257/259416045000*x2-2155417/185297175000*x3+3817/882367500*x4-3817/3603000625*x5+9823/4323600750*x6-6611/3088286250*x7+11/14706125*x8+132/720600125,
	  -4410845887/83980800000*x2*x5+98726719/2799360000*x3*x5-328937/46656000*x4*x5+4410845887/83980800000*x1*x6-9253111/777600000*x3*x6+123137/38880000*x4*x6-98726719/2799360000*x1*x7+9253111/777600000*x2*x7-343/648000*x4*x7+328937/46656000*x1*x8-123137/38880000*x2*x8+343/648000*x3*x8-4769137513/83980800000*x1+71883539/933120000*x2-15109493/388800000*x3+16807/2430000*x4-5764801/174960000*x5+112825391/3359232000*x6-42235991/2799360000*x7+117649/46656000*x8+40353607/3359232000,
	  368830385/144*x2*x5-191905945/432*x3*x5+1569491/72*x4*x5-368830385/144*x1*x6+17350795/432*x3*x6-187187/72*x4*x6+191905945/432*x1*x7-17350795/432*x2*x7+1309/12*x4*x7-1569491/72*x1*x8+187187/72*x2*x8-1309/12*x3*x8+3636796009/108*x1-2778704621/216*x2+367872197/216*x3-2710939/36*x4+189765730/3*x5-54932185/3*x6+6551545/3*x7-91630*x8-76969200,
	  368830385/144*x2*x5-191905945/432*x3*x5+1569491/72*x4*x5-368830385/144*x1*x6+17350795/432*x3*x6-187187/72*x4*x6+191905945/432*x1*x7-17350795/432*x2*x7+1309/12*x4*x7-1569491/72*x1*x8+187187/72*x2*x8-1309/12*x3*x8+3636796009/108*x1-2778704621/216*x2+367872197/216*x3-2710939/36*x4+189765730/3*x5-54932185/3*x6+6551545/3*x7-91630*x8-76969200);
     A = CC[gens R];
     phi = map(A,R);
     phi ideal apply(I_*, f -> 1/(leadCoefficient f) * f)
     )
