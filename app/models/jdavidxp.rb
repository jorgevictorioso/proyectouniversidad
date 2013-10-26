class Jdavidxp
	def crypbase64(x)
		Base64.enconde64(x)
	end

	def crypmd5(x)
		Digest::MD5::hexdigest(x)
	end
end