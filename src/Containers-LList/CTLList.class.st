"
Do we want it functional or not. 

is rest modifying the receiver?
```
| ll rest |
ll := CTLList new.
ll addFirst: $A.
ll addFirst: $B.
rest := ll rest.
self assert: rest size equals: 1.
self assert: rest first equals: $A.
```

or is rest returning a new list
 
```
| ll rest |
ll := CTLList new.
ll addFirst: $A.
ll addFirst: $B.
self assert: ll rest size equals: 1.
self assert: ll rest first equals: $A.
```

since first does not modify the receiver rest should not modify either. 
because this is strange to remove the first element when we ask the rest.
"
Class {
	#name : #CTLList,
	#superclass : #Object,
	#instVars : [
		'items'
	],
	#category : #'Containers-LList'
}

{ #category : #adding }
CTLList >> add: anElement [
	"Add is more like cons i.e, adding in front"
	
	^ self addFirst: anElement
]

{ #category : #adding }
CTLList >> addFirst: anElement [ 
	items addFirst: anElement.
	^ anElement
]

{ #category : #append }
CTLList >> append: anotherList [
	"Add the argument list at the end of the receiver."
	
	items addAll: anotherList items.
	^ self 
]

{ #category : #accessing }
CTLList >> first [
	"a.k.a car"
	
	^ items at: 1
]

{ #category : #initialization }
CTLList >> initialize [ 

	super initialize.
	items := OrderedCollection new.
]

{ #category : #testing }
CTLList >> isEmpty [
	^ items isEmpty
]

{ #category : #'private implementation' }
CTLList >> items [ 
	
	^ items
]

{ #category : #'private implementation' }
CTLList >> items: aColl [
	
	items := aColl
]

{ #category : #accessing }
CTLList >> rest [
	"a.k.a. cdr"
	
	^ CTLList new items: items allButFirst
]

{ #category : #accessing }
CTLList >> second [
	"a.k.a cadr"
	^ items at: 2
]

{ #category : #testing }
CTLList >> size [ 
	^ items size
]
