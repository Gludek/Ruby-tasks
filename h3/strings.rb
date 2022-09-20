def test(a,b)
	h={}
	sharingSubstring= false
	(a.split(/\s*/)).map {|s|  h[s]? h[s]+=1 : h[s]=1}
	(b.split(/\s*/)).map {|s|  h[s]? sharingSubstring= true : h[s]=1}
	return sharingSubstring
end
puts test('a b c A',"a").inspect
a='abc a b'
puts a.split(/\s*/).inspect