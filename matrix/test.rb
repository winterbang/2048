require File.dirname(__FILE__)+'/zwt'  

m1 = Zwt::Matrix.new([[1, 2, 3], [4, 5, 6], [7, 8, 9]])

p m_t = m1.transpose

m2 = Zwt::Matrix.new(m_t)

p m2.transpose

p m2.instance_of? Zwt::Matrix

p m1.matrix

p m2.matrix

p m1 * m2

p m1 + m2

Zwt::Matrix.new("a")

 