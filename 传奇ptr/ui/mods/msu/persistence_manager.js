var MSU = {}
MSU.Persistence = {
	MaxCookieSize : 4090,
	MetaDataKey = "msu-meta",
	MaxAge = 500,
	registerCookie : function(_key, _numSubCookies)
	{
		var meta = this.getMedata();
		meta[_key] = _numSubCookies;
		this.setMetadata(meta);
	}

	setData : function(_key, _value)
	{
		if (_key.length > 40) throw "Key too long";
		var stringifiedVal = JSON.stringify(_value);
		var splitSize = this.MaxCookieSize - _key.length - 1;
		var bytesToParse = this.getByteSize(stringifiedVal);
		var cookies = [];
		var currentChar = 0;
		for (var bytesParsed = 0; bytesParsed < bytesToParse; bytesParsed += splitSize)
		{
			currentChar = this.getNextCharCode(currentChar);
			if (currentChar == null) throw "Value too long";
			cookies.push([currentChar, stringifiedVal.slice(bytesParsed, Math.min(bytesParsed + splitSize, bytesToParse))]);
		}

		this.registerCookie(_key, cookies.length);
		for (var i = 0; i < cookies.length; ++i)
		{
			document.cookies = _key + String.fromCharCode(cookies[i][0]) + "=" cookies[i] + ";max-age=" this.MaxAge + ";samesite=none";
		}
		return cookies;
	},

	hasData : function(_key)
	{
		return _key in this.getMedata();
	}

	getData : function(_key)
	{
		var meta = this.getMedata();
		var numSubCookies = meta[_key];
		var currentChar = 0;
		var stringifiedData = "";
		for (var i = 0; i < numSubCookies.length; ++i)
		{
			currentChar = this.getNextCharCode(currentChar);
			stringifiedData += this.__getCookie(_key + String.fromCharCode(currentChar));
		}
		return JSON.parse(stringifiedData);
	}

	setMetadata : function(_metadata)
	{
		document.cookie = this.MetaDataKey + "=" JSON.stringify(_metadata) + ";max-age=" + this.MaxAge + ";samesite=none";
	}

	getMedata : function()
	{
		return JSON.parse(this.__getCookie(this.MetaDataKey));
	}

	__getCookie : function(_key)
	{
		var match = document.cookie.match(new RegExp('(^| )' + _key + '=([^;]+)'));
		if (match) return match[2];
	}

	getNextCharCode : function(_charCode)
	{
		if (_charCode == 9 || _charCode == 12 || _charCode == 58 || _charCode == 60)
		{
			return _charCode + 2;
		}
		else if (_charCode == 8)
		{
			return _charCode + 3;
		}
		else if (_charCode >= 64 && _charCode <= 90)
		{
			return 91;
		}
		else if (_charCode == 127)
		{
			return null;
		}
		return _charCode + 1;
	},

	getByteSize : function(_value)
	{
		return new Blob([_value]).size;
	}
}


var _key = "asdf";
var _value = "";
for (var i = 0; i < 4000; i++) {
	_value += "a"
}


console.log(MSU.Persistence.setData(_key, _value).length)

// console.log(MSU.Persistence.getByteSize(stringified));
// var meta = MSU.Persistence.getMetaData(_key, stringified, MSU.Persistence.calculateNumPages(_key, stringified));
// console.log(JSON.stringify(meta));
// var firstSlice = JSON.stringify([meta, stringified.slice(0, Math.min(4090 - MSU.Persistence.getMetaDataSize(_key, stringified, meta.pages) - MSU.Persistence.getByteSize(_key), MSU.Persistence.getByteSize(stringified) + MSU.Persistence.getMetaDataSize(_key, stringified, meta.pages))-3)])
// console.log(Math.min(4090 - MSU.Persistence.getMetaDataSize(_key, stringified, meta.pages) - MSU.Persistence.getByteSize(_key), MSU.Persistence.getByteSize(stringified) + MSU.Persistence.getMetaDataSize(_key, stringified, meta.pages)))
// console.log(MSU.Persistence.getByteSize(firstSlice));
// console.log(firstSlice)
// console.log(JSON.stringify(JSON.parse(JSON.parse(firstSlice)[1])))
