clear
clc

origin = [0 0];

vectorA = [1 0];
vectorB = [-0.5 0.866];
vectorC = [-0.5 -0.866];

# 0:24, i*15
for i = 0:90
  angle = i*4
  currentA = cos(deg2rad(angle));
  currentB = cos(deg2rad(angle-120));
  currentC = cos(deg2rad(angle+120));

  vectorA_scaled = currentA*vectorA;
  vectorB_scaled = currentB*vectorB;
  vectorC_scaled = currentC*vectorC;

  resultant = vectorA_scaled + vectorB_scaled + vectorC_scaled;

  hold on

  axis([-2 2 -2 2])
  plot([origin(1) vectorA_scaled(1)],
  [origin(2) vectorA_scaled(2)],"color","red","linewidth", 5)

  plot([origin(1) 1.5*vectorA(1)],
  [origin(2) 1.5*vectorA(2)],"color","red","linewidth", 1)

  plot([origin(1) vectorB_scaled(1)],
  [origin(2) vectorB_scaled(2)],"color","green","linewidth", 5)

  plot([origin(1) 1.5*vectorB(1)],
  [origin(2) 1.5*vectorB(2)],"color","green","linewidth", 1)

  plot([origin(1) vectorC_scaled(1)],
  [origin(2) vectorC_scaled(2)],"color","yellow","linewidth", 5)

  plot([origin(1) 1.5*vectorC(1)],
  [origin(2) 1.5*vectorC(2)],"color","yellow","linewidth", 1)

  plot([origin(1) resultant(1)],
  [origin(2) resultant(2)],"color","blue","linewidth", 5)

  axis("off")

  file_name = [num2str(i) ".png"];
  print(file_name)
  clf
endfor
