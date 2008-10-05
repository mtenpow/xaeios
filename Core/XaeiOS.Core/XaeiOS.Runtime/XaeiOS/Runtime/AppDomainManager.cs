using System;

namespace XaeiOS.Runtime
{
    public static class AppDomainManager
    {
        private static NativeArray<AppDomain> _appDomains;

        public static AppDomain DefaultAppDomain
        {
            get
            {
                return _appDomains[0];
            }
        }

        internal static void Initialize()
        {
            _appDomains = new NativeArray<AppDomain>();

            // create default appdomain
            _appDomains[0] = CreateAppDomain("Default AppDomain");
        }

        public static AppDomain CreateAppDomain(string name)
        {
            AppDomain appDomain = new AppDomain(name);
            appDomain.RuntimeId = RuntimeManager.GenerateRuntimeId();
            return appDomain;
        }
    }
}