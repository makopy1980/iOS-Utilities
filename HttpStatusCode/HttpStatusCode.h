//
//  HttpStatusCode.h
//

#ifndef _HTTP_STATUS_CODE_H_
#define _HTTP_STATUS_CODE_H_

typedef enum {
    
    // 1xx
    HttpStatusCodeContinue = 100,
    HttpStatusCodeSwitchingProtocols = 101,
    HttpStatusCodeProcessing = 102,
    
    // 2xx
    HttpStatusCodeOK = 200,
    HttpStatusCodeCreated = 201,
    HttpStatusCodeAccepted = 202,
    HttpStatusCodeNonAuthoritativeInformation = 203,
    HttpStatusCodeNoContent = 204,
    HttpStatusCodeResetContent = 205,
    HttpStatusCodePartialContent = 206,
    
    // 3xx
    HttpStatusCodeMultipleChoices = 300,
    HttpStatusCodeMovedPermanently = 301,
    HttpStatusCodeFound = 302,
    HttptatusCodeSeeOther = 303,
    HttpStatusCodeNotModified = 304,
    HttpStatusCodeUseProxy = 305,
    HttpStatusCodeSwitchProxy = 306,
    HttpStatusCodeTemporaryRedirect = 307,
    HttpStatusCodePermanentRedirect = 308,
    
    // 4xx
    HttpStatusCodeBadRequest = 400,
    HttpStatusCodeUnauthorized = 401,
    HttpStatusCodePaymentRequired = 402,
    HttpStatusCodeForbidden = 403,
    HttpStatusCodeNotFound = 404,
    HttpStatusCodeMethodNotAllowed = 405,
    HttpStatusCodeNotAcceptable = 406,
    HttpStatusCodeProxyAuthenticationRequired = 407,
    HttpStatusCodeRequestTimeout = 408,
    HttpStatusCodeConflict = 409,
    HttpStatusCodeGone = 410,
    HttpStatusCodeLengthRequired = 411,
    HttpStatusCodePreconditionFailed = 412,
    HttpStatusCodeRequestEntityTooLarge = 413,
    HttpStatusCodeRequestURITooLong = 414,
    HttpStatusCodeUnsupportedMediaType = 415,
    HttpStatusCodeRequestedRangeNotSatisfiable = 416,
    HttpStatusCodeExpectationFailed = 417,
    
    // 5xx
    HttpStatusCodeInternalServerError = 500,
    HttpStatusCodeNotImplemented = 501,
    HttpStatusCodeBadGateway = 502,
    HttpStatusCodeServiceUnavailable = 503,
    HttpStatusCodeGatewayTimeout = 504,
    HttpStatusCodeHTTPVersionNotSupported = 505,
    HttpStatusCodeNetworkReadTimeoutError = 598,
    HttpStatusCodeNetworkConnectTimeoutError = 599
    
} HttpStatusCode;


#endif  // _HTTP_STATUS_CODE_H_
