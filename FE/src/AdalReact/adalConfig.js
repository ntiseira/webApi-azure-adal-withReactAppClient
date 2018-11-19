import { AuthenticationContext, adalFetch, withAdalLogin, adalGetToken } from 'react-adal';

// Endpoint URL
export const endpoint = '';


export const adalConfig = {
  instance: 'https://login.microsoftonline.com/',
tenant: '',
clientId: '',
postLogoutRedirectUri: window.location.origin,
  cacheLocation: 'localStorage',

  endpoints: {
    api:endpoint
}
};

export const authContext = new AuthenticationContext(adalConfig);

export const adalApiFetch = (fetch, url, options) =>
  adalFetch(authContext, adalConfig.endpoints.api, fetch, url, options);

export const withAdalLoginApi = withAdalLogin(authContext, adalConfig.endpoints.api);

export const adalGetTokenApp= (fetch, url, options) =>
    adalGetToken(this.authContext, endpoint);

