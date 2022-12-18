Class {
	#name : #CTLListTest,
	#superclass : #TestCase,
	#category : #'Containers-LList'
}

{ #category : #'tests - adding' }
CTLListTest >> testAddFirstIsAddingInFront [

	| ll |
	ll := CTLList new.
	ll addFirst: $A.
	ll addFirst: $B.
	self assert: ll size equals: 2.
	self assert: ll first equals: $B.
]

{ #category : #'tests - adding' }
CTLListTest >> testAddIsAddingInFront [

	| ll |
	ll := CTLList new.
	ll add: $A.
	ll add: $B.
	self assert: ll size equals: 2.
	self assert: ll first equals: $B.
]

{ #category : #'tests - adding' }
CTLListTest >> testAddIsModifyingTheReceiver [

	| ll |
	ll := CTLList new.
	ll add: $A.
	self assert: ll size equals: 1.
	self assert: ll first equals: $A.
]

{ #category : #'tests - adding' }
CTLListTest >> testAddIsReturningTheElement [

	| ll res |
	ll := CTLList new.
	res := ll add: $A.
	self assert: res equals: $A.
]

{ #category : #'tests - append' }
CTLListTest >> testAppend [
	
	| firstList secondList |
	firstList := (CTLList new addFirst: $B; addFirst: $A; yourself).
	secondList := (CTLList new addFirst: $Z; addFirst: $X; yourself).
	firstList append: secondList.
	self assert: firstList size equals: 4.
	self assert: firstList first equals: $A.
	self assert: firstList rest first equals: $B.
	self assert: firstList rest rest first equals: $X.
	self assert: firstList rest rest rest first equals: $Z.
]

{ #category : #'tests - testing' }
CTLListTest >> testIsEmpty [

	self assert: CTLList new isEmpty.
	self deny: (CTLList new add: $A; isEmpty)
]

{ #category : #'tests - accessing' }
CTLListTest >> testRestDoesNotModifyTheReceiver [

	| ll |
	ll := CTLList new.
	ll addFirst: $A.
	ll addFirst: $B.
	ll rest.
	ll rest.
	self assert: ll rest size equals: 1.
	self assert: ll rest first equals: $A.
]

{ #category : #'tests - accessing' }
CTLListTest >> testRestOfAnEmptyList [

	| ll res |
	ll := CTLList new.
	res := ll rest.
	self assert: res isEmpty.
	ll addFirst: $A.
	self assert: res isEmpty.
	self assert: ll size equals: 1
]

{ #category : #'tests - accessing' }
CTLListTest >> testRestOfAnNonEmptyListIsANewList [

	| ll rest |
	ll := CTLList new.
	ll addFirst: $A.
	ll addFirst: $B.
	rest := ll rest.
	self assert: rest size equals: 1.
	self assert: rest first equals: $A.
	ll addFirst: $Z.
	
	self assert: ll size equals: 3.
	self assert: rest size equals: 1.
	self assert: rest first equals: $A.
]
