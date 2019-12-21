const db = require("../data/dbConfig.js");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove
};

function find() {
  return db.select("*").from("schemes");
}
function findById(id) {
  return db("schemes") // from schemes
    .where({ id })
    .first(); // get first one that matches, no more
}
function findSteps(id) {
  return db("steps") // from steps
    .select(
      "steps.id",
      "steps.scheme_name",
      "steps.step_number",
      "steps.instructions"
    )
    .join("schemes", "steps.scheme_id", "scheme.id")
    .where("steps.scheme_id", "=", id) // where this is true
    .orderBy("steps.step_number");
}
function add(scheme) {
  return db("schemes")
    .insert(scheme)
    .then(id => findById(id[0]));
}
function update(changes, id) {
  return db("schemes")
    .update(changes)
    .where({ id })
}

function remove(id) {
  return db("schemes")
    .del()
    .where({ id })
}