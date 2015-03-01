$.extend({
    createElement: function(el, props) {
        var $el = $(document.createElement(el));
        $el.attr(props);
        return $el;
    }
});


// show loading
//TODO: too much repetition here, add method
loaderElem = $.createElement('div', {'class':'spinner','id':'loader'});

loaderSubElem1 = $.createElement('div',{'class':'spinner-container container1'});
loaderSubElem2 = $.createElement('div',{'class':'spinner-container container2'});
loaderSubElem3 = $.createElement('div',{'class':'spinner-container container3'});
loaderSubElem1.append($.createElement('div', {'class':'circle1'}));
loaderSubElem1.append($.createElement('div', {'class':'circle2'}));
loaderSubElem1.append($.createElement('div', {'class':'circle3'}));
loaderSubElem1.append($.createElement('div', {'class':'circle4'}));
loaderSubElem2.append($.createElement('div', {'class':'circle1'}));
loaderSubElem2.append($.createElement('div', {'class':'circle2'}));
loaderSubElem2.append($.createElement('div', {'class':'circle3'}));
loaderSubElem2.append($.createElement('div', {'class':'circle4'}));
loaderSubElem3.append($.createElement('div', {'class':'circle1'}));
loaderSubElem3.append($.createElement('div', {'class':'circle2'}));
loaderSubElem3.append($.createElement('div', {'class':'circle3'}));
loaderSubElem3.append($.createElement('div', {'class':'circle4'}));
loaderElem.append(loaderSubElem1);
loaderElem.append(loaderSubElem2);
loaderElem.append(loaderSubElem3);

