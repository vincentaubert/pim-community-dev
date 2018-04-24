<?php

declare(strict_types=1);

namespace Akeneo\Test\Acceptance\Attribute;

use Akeneo\Test\Acceptance\AttributeGroup\InMemoryAttributeGroupRepository;
use Akeneo\Test\Common\Builder\EntityBuilder;
use Behat\Behat\Context\Context;
use Behat\Gherkin\Node\TableNode;
use Pim\Component\Catalog\Model\AttributeGroupInterface;

class AttributeContext implements Context
{
    /** @var InMemoryAttributeRepository */
    private $attributeRepository;

    /** @var EntityBuilder */
    private $attributeBuilder;

    /** @var InMemoryAttributeGroupRepository */
    private $attribueGroupRepository;

    /** @var EntityBuilder */
    private $attributeGroupBuilder;

    public function __construct(
        InMemoryAttributeRepository $attributeRepository,
        EntityBuilder $attributeBuilder,
        InMemoryAttributeGroupRepository $attribueGroupRepository,
        EntityBuilder $attributeGroupBuilder
    ) {
        $this->attributeRepository = $attributeRepository;
        $this->attributeBuilder = $attributeBuilder;
        $this->attribueGroupRepository = $attribueGroupRepository;
        $this->attributeGroupBuilder = $attributeGroupBuilder;
    }

    /**
     * @Given the following attribute:
     */
    public function theFollowingAttribute(TableNode $table)
    {
        foreach ($table->getHash() as $attributeData) {
            if (!isset($attributeData['group'])) {
                $group = $this->attributeGroupBuilder->build(['code' => 'other_group']);
                $this->attribueGroupRepository->save($group);

                $attributeData['group'] = 'other_group';
            }

            $attribute = $this->attributeBuilder->build($attributeData);
            $this->attributeRepository->save($attribute);
        }
    }
}
