using Umbraco.Cms.Core.Sync;

namespace AlinaCrossRegionLoad.Web.ServerRoleAccessors
{
	public class SchedulingPublisherServerRoleAccessor : IServerRoleAccessor
	{
		public ServerRole CurrentServerRole => ServerRole.SchedulingPublisher;
	}
}

// test