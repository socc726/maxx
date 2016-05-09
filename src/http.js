module.exports = {
	client: $http
}

var clientId,
masterKey,
functionIndex = 0

function $http(functionsToCall) {
  var core = {
    ajax: makeHttpRequest,
	success: function(data){
		// console.log(1, 'success', JSON.parse(data));
		functionIndex++;
		if((functionIndex + 1) > functionsToCall.length){
		return;
		}
		if(functionsToCall.length == 0){
		return;
		}
		callFunction(functionsToCall[functionIndex], valuesToArray(data));
	},
	error : function(err){
		// console.log(2, 'error', err);
	}
  };

  return {
    'get' : function(request){
      return core.ajax('GET', request);
    },
    'post': function(request){
      return core.ajax('POST', request);
    },
    'put': function(request){
      return core.ajax('PUT', request);
    },
    'delete': function(request){
      return core.ajax('DELETE', request);
    },
    'success': core.success,
    'error': core.error
  }
}

function makeHttpRequest(method, request){

  var promise = new Promise( function(resolve, reject) {

    var client = new XMLHttpRequest(),
    url = request.url,
    queryParams = request.queryParams,
    headers = request.requestHeaders,
    callback = request.callback,
    data = request.data;

    url += setQueryParams(queryParams);

    client.open(method, url, true);

    setHeaders(headers, client);

    client.onload = function() {
      if (this.status >= 200 && this.status < 300) {
      	var res = JSON.parse(this.response);
        resolve(res);
      } else{
        reject(this.statusText);
      }
    };

    client.onerror = function() {
      reject(this.statusText);
    }

    if(data){
    	data = JSON.stringify(data);
    }

    client.send(data);

  });

  return promise;
}

function setQueryParams(queryParams){
  var queryString = "";
  if(!queryParams){
    return queryString;
  }
  if(Object.keys(queryParams).length > 0 ){
    var i = 0;
    queryString = "?";
    for (var key in queryParams) {
      i++;
      if(i++){
        queryString += "&";
      }
      queryString += ( encodeURIComponent(key) + "=" +encodeURIComponent(queryParams[key]) + "&" );
    };
  }
  return queryString;
}

function setHeaders(headers, client){
  if(!headers){
    return;
  }
  if(Object.keys(headers).length > 0){
    for (var key in headers) {
      client.setRequestHeader(key, headers[key]);
    };
  }
}

function valuesToArray(obj){
  var values = [];

  try {
    obj = JSON.parse(obj);
    for(var key in obj) {
      values.push(obj[key]);
    }
  } 
  catch(e) {
    values.push(obj);
  }

  return values;
}

function callFunction(func, params){
  func.apply(null, params);
}
