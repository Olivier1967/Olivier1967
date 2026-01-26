// This module uses lodash

const main = () => decorate({node: window.action
  , onchange: (ev) => whether({value: ev.target.value,
      on: () => activate_webcam({onerror: log_error({output_node: window.log_output})}),
      off: () => shut_webcam({onerror: log_error({output_node: window.log_output})}),
    })
});

const whether = ({value, ...callbacks}) =>
{
  if(!(value in callbacks))
    throw new Error(`Value '${value}' not supported`);

  if(!_.isFunction(callbacks[value]))
    throw new Error(`Value referenced by '${value}' is not a function`);

  return callbacks[value]();
};

const decorate = ({node, onchange}) =>
{
  node.addEventListener('change', onchange);
};

const log_error = ({output_node}) =>
{
  if(!output_node)
    throw new Error('Output node is null');

  if('object' != typeof output_node)
    throw new Error('Output node should be an object');

  if(!(output_node instanceof window.HTMLUListElement))
    throw new Error(`Output node type '${output_node.constructor.name}' is not supported`);

  return ({err}) =>
  {
    const li = output_node.ownerDocument.createElement('li');
    li.textContent = err;
    output_node.appendChild(li);
  }
};

const activate_webcam = ({onerror}) =>
  navigator.mediaDevices.getUserMedia({video: true})
    .then( stream => window.output.srcObject = stream )
    .catch(err => _.isFunction(onerror) && onerror({err}))
;

const shut_webcam = ({onerror}) =>
    window.output instanceof HTMLVideoElement &&
    window.output.srcObject instanceof MediaStream &&
    window.output.srcObject.getTracks().forEach(track => track.stop());

window.addEventListener('load', main);

/* vim:set et sts=2 ts=2 sw=2 : */
