using Umbraco.Cms.Core.Sync;

namespace AlinaCrossRegionLoad.Web.ServerRoleAccessors
{
	public class SingleServerRoleAccessor : IServerRoleAccessor
	{
		public ServerRole CurrentServerRole => ServerRole.Single;
	}
}
