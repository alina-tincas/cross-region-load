using Umbraco.Cms.Core.Sync;

namespace AlinaCrossRegionLoad.Web.ServerRoleAccessors
{
	public class SubscriberServerRoleAccessor : IServerRoleAccessor
	{
		public ServerRole CurrentServerRole => ServerRole.Subscriber;
	}
}
