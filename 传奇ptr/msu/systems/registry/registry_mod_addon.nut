::MSU.Class.RegistryModAddon <- class extends ::MSU.Class.SystemModAddon
{
	UpdateSource = null;
	Link = null;

	function setGithubSource( _link )
	{
		::MSU.requireString(_link);
		this.UpdateSource = _link;
	}

	function setLink( _link )
	{
		::MSU.requireString(_link);
		this.Link = _link;
	}

	function hasSource()
	{
		return this.UpdateSource != null;
	}

	function getSource()
	{
		return this.UpdateSource;
	}
}
MSU.Uitil
