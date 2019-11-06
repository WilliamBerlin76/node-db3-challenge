const db = require('../data/db-config.js');

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
};

function find(){
    return db('schemes');
};

function findById(id){
    return db('schemes').where({ id }).first();
};

function findSteps(id){
    return db.select('schemes.scheme_name', 'steps.step_number', 'steps.instructions')
                .where('schemes.id', '=', id)
                .from('schemes')
                .join('steps', 'schemes.id', '=', 'steps.scheme_id')
                .orderBy('steps.step_number', 'asc')
};

function add(scheme){
    return db('schemes')
            .insert(scheme)
};

function update(changes, id){
    return db('schemes')
            .where({id})
            .update(changes)
};

function remove(id){
    return db('schemes')
            .where({id})
            .first()
            .del()
};