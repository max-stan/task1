async function onCategoryItemClick(e) {
    const url = e.target.href;

    window.history.pushState({}, "", url);

    const response = await fetch(url, {
        method: 'POST'
    });

    document.querySelector('#content-wrapper').outerHTML = await response.text();
}

async function onSortingClick() {
    const sortingElement = document.querySelector('#sorting');

    const urlObject = new URL(window.location.href);
    urlObject.searchParams.set('sorting', sortingElement.value);

    const url = urlObject.toString();
    window.history.pushState({}, "", url);

    const response = await fetch(url, {
        method: 'POST'
    });

    document.querySelector('#content-wrapper').outerHTML = await response.text();
}

const handlers = {
    '.category-item': onCategoryItemClick,
    '#sorting': onSortingClick,
}

document.addEventListener('click', (e) => {
    for (const key in handlers) {
        if (!e.target.matches(key)) {
            continue;
        }

        e.preventDefault();
        handlers[key](e);
    }
});