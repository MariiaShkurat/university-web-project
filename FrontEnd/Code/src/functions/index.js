
export const namePattern = value => /^[A-Za-z '-.,`]{1,64}$|^[А-ЯЄІЇа-яєії '-.,`]{1,64}$/gm.test(value);
export const personNamePattern = value => /^[A-Z]+[a-z '-.,`]{1,64}$|^[А-ЯЄІЇ]+[а-яєії '-.,`]{1,64}$/gm.test(value);
export const groupPattern = value => /^[A-Za-z]{1,2}-[0-9]{1,2}$|^[A-Za-z]{1,2}-[0-9]{1,2}[A-Za-z]{1,3}$|^[А-ЯЄІЇа-яєії]{1,2}-[0-9]{1,2}$|^[А-ЯЄІЇа-яєії]{1,2}-[0-9]{1,2}[А-ЯЄІЇа-яєії]{1,3}$/gm.test(value);

