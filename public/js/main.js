function getProductItemHtml({ name, description, price, id, created_at }) {
    return `
        <li class="product-list-item">
            <div class="card">
                <img class="card-img-top" src="https://picsum.photos/300/150" width="300px" height="150px" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">
                        ${name}
                    </h5>
                    <p class="card-text">
                        ${description}
                    </p>
                    <p class="price mb-3">
                        <span class="fw-bold">\$${price}</span> <br>
                        <small class="mb-3">Created at ${created_at}</small>
                    </p>
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal-${id}">Add to Card</button>
                </div>
                <div class="modal fade" id="modal-${id}" tabindex="-1" aria-labelledby="modalLabel-${id}" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="modalLabel-${id}">${name}</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p class="card-text">
                                    ${description}
                                </p>
                                <p class="price">
                                    <span class="fw-bold">\$${price}</span> <br>
                                    <small class="mb-3">Created at ${created_at}</small>
                                </p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </li>
    `;
}

async function onCategoryItemClick(e) {
    const activeCategory = document.querySelector('.category-item.active');

    if (activeCategory === e.target) {
        return;
    }

    activeCategory
        .classList
        .remove('active');

    e.target.classList.add('active');

    const url = e.target.href;

    window.history.pushState({}, "", url);

    const response = await fetch(url, {
        method: 'POST'
    });

    if (response.status !== 200) {
        console.error('Something went wrong');
        return;
    }

    const data = await response.json();
    const elements = data.map(item => getProductItemHtml(item));

    document.querySelector('.product-list').innerHTML = elements.join('');
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

    if (response.status !== 200) {
        console.error('Something went wrong');
        return;
    }

    const data = await response.json();
    const elements = data.map(item => getProductItemHtml(item));

    document.querySelector('.product-list').innerHTML = elements.join('');
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